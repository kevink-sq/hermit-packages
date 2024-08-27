description = "Backup and migrate Kubernetes applications and their persistent volumes."
binaries = ["velero"]
test = "velero version --client-only"
repository = "https://github.com/vmware-tanzu/velero"
source = "https://github.com/vmware-tanzu/velero/releases/download/v${version}/velero-v${version}-${os}-${arch}.tar.gz"

on "unpack" {
  rename {
    from = "${root}/velero-v${version}-${os}-${arch}/velero"
    to = "${root}/velero"
  }
}

platform "darwin" {
  source = "https://github.com/vmware-tanzu/velero/releases/download/v${version}/velero-v${version}-${os}-amd64.tar.gz"
}

platform "windows" {
  source = "https://github.com/vmware-tanzu/velero/releases/download/v${version}/velero-v${version}-${os}-amd64.tar.gz"
}

version "1.9.2" "1.9.3" "1.10.0" "1.9.4" "1.9.5" "1.10.1" "1.10.2" "1.11.0" "1.11.1"
        "1.12.0" "1.12.1" "1.12.2" "1.12.3" "1.13.0" "1.13.1" "1.13.2" "1.14.0" "1.14.1" {
  auto-version {
    github-release = "vmware-tanzu/velero"
  }
}

sha256sums = {
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.2/velero-v1.9.2-linux-amd64.tar.gz": "6727ed2ab68bec962c70682f63943acb44028e0f92a1201a1101b3347a9c4840",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.2/velero-v1.9.2-darwin-amd64.tar.gz": "89fce9b88ac0de34c52874e00054bbaaa101160c5a8160c76e3ee8570a1d4c21",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.3/velero-v1.9.3-linux-amd64.tar.gz": "13e498c1ebec1e7c5bd633cbd39775e2b60cc55c29333abf019abaf29f19cc0e",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.3/velero-v1.9.3-darwin-amd64.tar.gz": "3b31a30ce60326ca77b77394b3936677c93306f11eb7d03b9a964f8012b10578",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.10.0/velero-v1.10.0-darwin-amd64.tar.gz": "93eecbced3fa340b52c8b2159bd7b2d02164db4777978c23da3e4fbe936a1153",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.10.0/velero-v1.10.0-linux-amd64.tar.gz": "3cf8c26b17a06f3f43ec43c854618a619f4e14e2e690bd813e55797aae1db155",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.4/velero-v1.9.4-linux-amd64.tar.gz": "7b8dd562a3334d3bd10c34f01700c08eb2721fa2291e5391acf8d592852bb4fa",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.4/velero-v1.9.4-darwin-amd64.tar.gz": "309adb7aec7b33a039e10d5db31776de40123c1261d08744058366707f66829f",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.5/velero-v1.9.5-linux-amd64.tar.gz": "f2e1a91663b631626ae255a46d1e422406a338336d106e899f9cb1cde7455090",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.9.5/velero-v1.9.5-darwin-amd64.tar.gz": "5bce669784aa6b082de226870803870d6013fa7c06fec6a7bdafe7cc2645d8e3",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.10.1/velero-v1.10.1-linux-amd64.tar.gz": "91187a3e727b25caa577934dc1587ac0db0f808aa8c2c85df291b84fe8ed9966",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.10.1/velero-v1.10.1-darwin-amd64.tar.gz": "2f90765ba1216d31d26e748ebf521ef26e4e8b0dbb39515b277c848d6f7f37d4",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.10.2/velero-v1.10.2-darwin-amd64.tar.gz": "7a621aebebf774b7ebe74485acf4f84da6dbfccd0b5c343eefc790ba9b8136eb",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.10.2/velero-v1.10.2-linux-amd64.tar.gz": "820d605796a05195d77724380be7dcb5a94a5c06b59dd710ca2dc89b54427c7d",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.11.0/velero-v1.11.0-darwin-amd64.tar.gz": "25ce7b01fb85f369f4450647f96e9da77f6d06c51f3e3c9075182c6e0034caf7",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.11.0/velero-v1.11.0-linux-amd64.tar.gz": "0d4db0d5081d8c3926d14fbdae28bc5ace9b9d07a2229d5f3077e32fcc52e579",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.11.1/velero-v1.11.1-darwin-amd64.tar.gz": "ab2b448b08da2e1451dec00c1a8b2b8dc661ab3b2cde14e6ea82d66fcba544a1",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.11.1/velero-v1.11.1-linux-amd64.tar.gz": "4bcd8282ecdc2fdeb94f7c04df67dc1085b1b93527caba99197366871ca5dfce",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.0/velero-v1.12.0-linux-amd64.tar.gz": "68a8201a13dee49c74c3ed4e2b525c80ec40b97543b5fa1ceb921195990d6ba6",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.0/velero-v1.12.0-darwin-amd64.tar.gz": "1b171792199c774854dd7a0d2587c8544f56680bdd3b84010894d8bf5240fbb2",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.1/velero-v1.12.1-linux-amd64.tar.gz": "c77296358c59336ba642fac4e8825e8e7bd1daf9e6dd0d641b0a537c89adebfa",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.1/velero-v1.12.1-darwin-amd64.tar.gz": "ddfe279f47b231108365a3ba3382342ab8a8728f61ad59e691adbb65dc9ead4a",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.2/velero-v1.12.2-darwin-amd64.tar.gz": "7087114411d14983679c34de8f035db34b009a7eeaf08d8cb3e3c01c15e67fd4",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.2/velero-v1.12.2-linux-amd64.tar.gz": "f33559f4fb7d6bbed422be45eeebc5ce7c1e8e78f6d8486292247bc661c3eb5e",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.3/velero-v1.12.3-darwin-amd64.tar.gz": "d72f90263f0bde6c42637bc9ba1410a124bb22d6dd1030b8539391565e4eb64f",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.12.3/velero-v1.12.3-linux-amd64.tar.gz": "5c1685e480eeb4f347a13f95d18e6ccf78b93a258c40b952d15c1249e7edeed8",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.13.0/velero-v1.13.0-darwin-amd64.tar.gz": "27bd1109b7fd6bda7e479db105956c2513f1a6764f551a3fd13afc1bdd2e9e7d",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.13.0/velero-v1.13.0-linux-amd64.tar.gz": "4cbb18a05c0dd3e60430e015e90d53fddbf4111a0252ea27877a8cea42bdea8f",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.13.1/velero-v1.13.1-linux-amd64.tar.gz": "5dc0ffcb56ae703230d030e6ce490a0e0c933e73745a84dd216677ba877a6f49",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.13.1/velero-v1.13.1-darwin-amd64.tar.gz": "65872a000b84513358405d9051ce49c8927ac3f5ddf3f22831f7775606787db4",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.13.2/velero-v1.13.2-linux-amd64.tar.gz": "f460ef5594c7f7b43a74a6c560268723cd7386e0e7ff8e172643ea236f579033",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.13.2/velero-v1.13.2-darwin-amd64.tar.gz": "39fb46aed9c78bc406e923541fbdbf24a610772b68c889a0c313ed4add96a6a3",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.14.0/velero-v1.14.0-linux-amd64.tar.gz": "9b066714cdb874fe34ec123645385d6f8c40c43308bbedf11d3265a7af17fda6",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.14.0/velero-v1.14.0-darwin-amd64.tar.gz": "aeb2783e3fc4c88aac81ee622fae144d92ef6e5ee386b5730a5124d8bd708889",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.14.1/velero-v1.14.1-darwin-amd64.tar.gz": "cc7a1101a2d98f277332c438e4bc47bda8de98f09063cb6a7441f3379677f031",
  "https://github.com/vmware-tanzu/velero/releases/download/v1.14.1/velero-v1.14.1-linux-amd64.tar.gz": "1e123f9deb9479f1cd41ba53b799d73b962cd6ff16acebfca233725638c73db2",
}
