import ProfilePage from "./ProfilePage";
import IndexPage from "./IndexPage";

const pages = [
  { path: "/", component: IndexPage, exact: true },
  { path: "/profile", component: ProfilePage },
];

export default pages;
