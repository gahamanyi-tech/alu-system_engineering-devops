# Load balancer

This directory contains the scripts that set up two Nginx web servers
(web-01 and web-02) behind an HAProxy load balancer (lb-01).

## Files

- `0-custom_http_response_header`: installs Nginx and adds an `X-Served-By`
  response header containing the server's hostname, so you can see which
  web server answered a request.
- `1-install_load_balancer`: installs HAProxy on lb-01 and balances traffic
  between web-01 and web-02 with a round-robin algorithm.

## Usage

Run each script as root on a new Ubuntu machine:

    ./0-custom_http_response_header
    ./1-install_load_balancer

Check the header with:

    curl -sI http://SERVER_IP | grep X-Served-By
