function IndexController($scope, $http) {
  $http.get('/restapi/getposts')
    .success(function (data) {
      $scope.elements = data.reverse();
      console.log('Success!');
      console.log($scope.elements);
    })

    .error(function (data) {
      console.log('Failed to get posts.');
    });
}