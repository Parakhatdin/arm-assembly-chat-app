# ARM Assembly Chat App Documentation

## Table of Contents

1. [Overview](#overview)
2. [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Installation](#installation)
3. [Usage](#usage)
4. [Features](#features)
5. [Architecture](#architecture)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)

## Overview

Welcome to AssemChat, a client-server chat application developed in ARM assembly language. AssemChat provides a real-time communication experience, leveraging the efficiency and optimization capabilities of ARM assembly. This documentation aims to guide you through the installation, usage, and contribution to the project.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- ARM architecture machine or emulator
- Basic knowledge of ARM assembly programming
- [GCC](https://gcc.gnu.org/) (GNU Compiler Collection) for assembling and linking

### Installation

1. Clone the AssemChat repository:

    ```bash
    git clone git@github.com:Parakhatdin/arm-assembly-chat-app.git
    cd arm-assembly-chat-app
    ```

2. Build the project using GCC:

    ```bash
    gcc -o server server.s
    ```
    ```bash
    gcc -o client client.s
    ```

## Usage

1. Start the server:

    ```bash
    ./arm-assembly-chat-app server
    ```

2. Start a client:

    ```bash
    ./arm-assembly-chat-app client
    ```

3. Follow the on-screen instructions for connecting and chatting.

## Features

- Real-time messaging: Enjoy instant communication between clients and the server.
- Client-Server Architecture: Scalable and organized for various deployment scenarios.
- ARM Assembly Implementation: Efficient and optimized code for ARM architecture.

## Architecture

AssemChat follows a client-server architecture. Clients connect to the server to exchange real-time messages. The application is implemented entirely in ARM assembly language, showcasing the capabilities of low-level programming.

## Contributing

We welcome contributions! Feel free to open issues, submit pull requests, or suggest improvements. Please follow our [contribution guidelines](CONTRIBUTING.md).

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For questions, feedback, or support, please contact us at [nuratdinov.p@gmail.com].
