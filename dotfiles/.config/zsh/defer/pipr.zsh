# pipr
function pipr_fn() {
  docker run --privileged -v $(pwd):/var/pipr -v $HOME/.config/pipr:/root/.config/pipr -it --rm pipr_cli pipr $@
}

function pipi_fn() {
  eval "$@" > pipr.in && pipr -d "cat pipr.in" --out-file pipr.out
}

function pipo_fn() {
  eval "$(cat pipr.out)"
}

function pipc_fn() {
  rm ./pipr.out
  rm ./pipr.in
}
