- mongodb 의 id 값을 사용해 데이터를 삭제하기
- Flask 사용

```python
# _id 를 포함해 workout data DB에서 가져오기
@app.route('/workout', methods=['GET'])
def send_workout():
    data_setting = {
        '_id': {'$toString': '$_id'},  # _id 필드를 string 으로 변환
        'date': True,  # mongodb 의 date 필드를 조회해옴. 'data': False 와 반대 의미 
        'weight': True,
        'count': True,
        'total': True,​
    }
​
    orders = list(db.my_project.find({}, data_setting))
​
    return jsonify({'result': 'success', 'orders': orders})
​
​
@app.route('/delete', methods=['POST'])
def delete_workout():
    id_receive = request.form['id_give']
​
    # ObjectId 로 변환한 후 해당 데이터 지우기
    db.my_project.delete_one({'_id': ObjectId(id_receive)})
​
    return jsonify({'result': 'success'})
```

```javascript
function workoutOrderRow(dbId, date, weight, count, total) {
                let tempHtml = `<tr>
                                <td>${date}</td>
                                <td>${weight}</td>
                                <td>${count}</td>
                                <td>${total}</td>
                                <td> <button onclick="delete_data('${dbId}')" type="button" class="btn btn-light">삭제하기</button> </td>
                              </tr>`;
                $("#workout-box").append(tempHtml);
​
            }

function delete_data(dbId) {
                $.ajax({
                    type: "POST",
                    url: "/delete",
                    data: {
                        id_give: dbId,
                    },
                    success: function (response) {
                        alert('삭제되었습니다.');
                        window.location.reload();
                    }
                });
            }

```