import Notify from "simple-notify";
import "simple-notify/dist/simple-notify.min.css";

class Toast {
  static DefaultSetting = {
    effect: "slide",
    speed: 300,
    customClass: "",
    customIcon: "",
    showIcon: true,
    showCloseButton: true,
    autoclose: true,
    autotimeout: 2000,
    gap: 20,
    distance: 20,
    type: 1,
    position: "right top",
  };

  static error({ title = "Error Happened!", text }) {
    new Notify({
      ...this.DefaultSetting,
      status: "error",
      title: title,
      text: text || null,
    });
  }

  static success({ title = "Success!!!", text }) {
    new Notify({
      ...this.DefaultSetting,
      status: "success",
      title: title,
      text: text || null,
    });
  }
}

export default Toast;
