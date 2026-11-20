namespace my.bookshop;

entity Books {
  key ID : UUID @Core.Computed;
  title  : String;
  author : String;
  stock  : Integer;
}