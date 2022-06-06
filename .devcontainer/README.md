# VS Code Container for Developing AWS Terraform Modules

This repository provides a standalone Docker container image build file (aka
[`Dockerfile`][]) and corresponding [Visual Studio Code][] (VS Code)
[configuration][] useful for leveraging [VS Code Remote Development feature][]
when developing [Terraform modules][] and corresponding [`terratest`][] tests
across any number of different infrastructure-as-code repositories.

## How to Use

1. Follow instructions in "[Remote development in Containers][]" to install
   1. VS Code
   2. Docker
   3. "[Remote - Containers][]" extension

   You may optionally follow the remainder of the tutorial, but it is not
   required.
2. Follow instructions in
   "[Configure a separate container for multiple projects or folders][]",
   cloning this repository to a directory named `.devcontainer/` next to the
   repositories in which you want to develop Terraform modules / `terratest`
   tests.

   For example, if you have an `aws/` parent directory that has multiple
   repositories cloned to different directories inside it like this:

   ```text
   aws/            # parent directory
     eks/          # Terraform module repos
     iam/
     nodegroup/
     ...
   ```

   Continue following the instructions linked above to:

   1. Open the `aws/` directory in VS Code.
   2. Re-open the directory in the container.

      **NOTE:** The first time you open the directory in the container, VS Code
      must build the container image from the `Dockerfile`. This may take a few
      minutes but only occurs the first time, if you change the `Dockerfile` or
      `.devcontainer.json`, or if you delete the container image.
   3. Open the repository where you want to do development from within the
      running container.

At this point you should be able to use the tools included in the Docker
container.

Please feel free to fork this repo to customize it for your specific use
case(s).

[`Dockerfile`]: ./Dockerfile
[Visual Studio Code]: https://code.visualstudio.com
[configuration]: ./devcontainer.json
[VS Code Remote Development feature]: https://code.visualstudio.com/docs/remote/remote-overview
[Terraform modules]: https://www.terraform.io/docs/language/modules/index.html
[`terratest`]: https://terratest.gruntwork.io
[Remote - Containers]: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
[Remote development in Containers]: https://code.visualstudio.com/docs/remote/containers-tutorial
[Configure a separate container for multiple projects or folders]: https://code.visualstudio.com/docs/remote/containers-advanced#_configure-a-separate-container-for-multiple-projects-or-folders
