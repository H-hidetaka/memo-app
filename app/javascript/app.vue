<template>
  <div id="app">
    <div class="form">
      <div class="form-group">
        <input v-model="title" placeholder="タイトル" class="form-control">
      </div>
      <div class="form-group">
      <!-- v-model というコードは初めて出てきました。v-model を使うことで、data () {}で定義したプロパティの値を更新できます。 -->
        <input v-model="description" placeholder="description" class="form-control">
      </div>
      <button @click="addMemo">メモを追加</button>
       <!--<button v-on:イベント名="関数"></button> 省略後<button @イベント名="関数"></button> -->
    </div>
    <!-- v-for という書き方はVue.js特有の書き方で配列を1つずつ要素として取り出します。 -->
    <div class="flex">
      <div v-for="memo in memos" :key="memo.id" class="card">
        <div class="card-body">
          <div class="card-title">
          {{ memo.title }}
          </div>
          {{ memo.description }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      memos: "memos",
      title:'',
      description:'',
      name:'',
      content:''
    }
  },
  mounted(){
    this.setMemo();
  },
  methods: {
    setMemo: function() {
      axios.get('/api/memos')
      .then(response => (
        this.memos = response.data
      ))
    },
    addMemo: function() {
      axios.post('/api/memos',{
        title: this.title,
        description: this.description,
      })
      .then(response =>(
        this.setMemo()
      ));
    }
  }
}
</script>

<style lang="scss" scoped>

.form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  margin: 32px;
  &-group {
    margin-bottom: 1rem;
  }
  &-control {
    width: 600px;
    min-height: 24px;
    font-size: 1rem;
    border: 1px solid #ced4da;
    padding: 5px 8px;
  }
}

button {
  width: 200px;
}

.flex {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.card {
  width: 238px;
  border: 1px solid rgba(0,0,0,.125);
  margin: 16px;
  &-body {
    padding: 1.25ren;
  }
  &-title {
    margin-bottom: .75rem;
    font-weight: 600;
  }
}
</style>
