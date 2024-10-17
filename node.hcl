description = "Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine."
test = "node --version"
binaries = ["bin/*"]
repository = "https://github.com/nodejs/node"
strip = 1
vars = {
  "node_libdir": "${HERMIT_ENV}/.hermit/node/lib",
}
env = {
  "COREPACK_HOME": "${HERMIT_ENV}/.hermit/node",
  "NPM_CONFIG_PREFIX": "${HERMIT_ENV}/.hermit/node",
  "NPM_CONFIG_CACHE": "${HERMIT_ENV}/.hermit/node/cache",
  "PATH": "${HERMIT_ENV}/node_modules/.bin:${NPM_CONFIG_PREFIX}/bin:${PATH}",
}
sha256-source = "https://nodejs.org/dist/v${version}/SHASUMS256.txt.asc"

on "activate" {
  mkdir {
    dir = "${node_libdir}"
  }
}

on "install" {
  mkdir {
    dir = "${node_libdir}"
  }
}

platform "amd64" {
  source = "https://nodejs.org/dist/v${version}/node-v${version}-${os}-x64.tar.gz"
}

platform "arm64" {
  source = "https://nodejs.org/dist/v${version}/node-v${version}-${os}-arm64.tar.gz"
}

// # arm64 only available for >=16
version "12.18.3" "12.22.12" "12.22.6" "12.22.7" "12.22.9" "14.16.0" "14.17.0"
        "14.17.3" "14.18.0" "14.19.0" "14.19.2" "14.21.0" "15.10.0" {
  platform "darwin" "arm64" {
    source = "https://nodejs.org/dist/v${version}/node-v${version}-${os}-x64.tar.gz"
  }
}

version "16.1.0" "16.10.0" "16.11.0" "16.13.0" "16.13.1" "16.14.0" "16.14.1"
        "16.15.0" "16.17.0" "16.17.1" "16.18.0" "16.2.0" "16.3.0" "16.4.0" "16.5.0" "16.6.0"
        "16.6.1" "16.6.2" "16.7.0" "16.8.0" "16.9.0" "16.9.1" "16.18.1" "16.19.0" "16.19.1"
        "16.20.0" "16.20.1" "16.20.2" {
  auto-version {
    github-release = "nodejs/node"
    ignore-invalid-versions = true
    version-pattern = "v(16.*)"
  }
}

version "17.0.0" "17.0.1" "17.1.0" "17.3.0" "17.3.1" "17.4.0" "17.5.0" "17.6.0"
        "17.7.0" "17.7.1" "17.7.2" "17.8.0" "17.9.0" "17.9.1" {
  auto-version {
    github-release = "nodejs/node"
    ignore-invalid-versions = true
    version-pattern = "v(17.*)"
  }
}

version "18.0.0" "18.1.0" "18.10.0" "18.11.0" "18.12.0" "18.2.0" "18.3.0" "18.4.0"
        "18.5.0" "18.6.0" "18.7.0" "18.8.0" "18.9.0" "18.9.1" "18.12.1" "18.13.0" "18.14.0"
        "18.14.2" "18.15.0" "18.16.0" "18.16.1" "18.17.0" "18.17.1" "18.18.0" "18.18.1"
        "18.18.2" "18.19.0" "18.19.1" "18.20.0" "18.20.1" "18.20.2" "18.20.3" "18.20.4" {
  auto-version {
    github-release = "nodejs/node"
    ignore-invalid-versions = true
    version-pattern = "v(18.*)"
  }
}

version "19.0.0" "19.0.1" "19.1.0" "19.2.0" "19.3.0" "19.4.0" "19.5.0" "19.6.0"
        "19.7.0" "19.8.0" "19.8.1" "19.9.0" {
  auto-version {
    github-release = "nodejs/node"
    ignore-invalid-versions = true
    version-pattern = "v(19.*)"
  }
}

version "20.0.0" "20.1.0" "20.2.0" "20.3.0" "20.3.1" "20.4.0" "20.5.0" "20.5.1"
        "20.6.0" "20.6.1" "20.7.0" "20.8.0" "20.8.1" "20.9.0" "20.10.0" "20.11.0" "20.11.1"
        "20.12.0" "20.12.1" "20.12.2" "20.13.0" "20.13.1" "20.14.0" "20.15.0" "20.15.1"
        "20.16.0" "20.17.0" "20.18.0" {
  auto-version {
    github-release = "nodejs/node"
    ignore-invalid-versions = true
    version-pattern = "v(20.*)"
  }
}

version "21.0.0" "21.1.0" "21.2.0" "21.3.0" "21.4.0" "21.5.0" "21.6.0" "21.6.1"
        "21.6.2" "21.7.0" "21.7.1" "21.7.2" "21.7.3" {
  auto-version {
    github-release = "nodejs/node"
    ignore-invalid-versions = true
    version-pattern = "v(21.*)"
  }
}

version "22.0.0" "22.1.0" "22.2.0" "22.3.0" "22.4.0" "22.4.1" "22.5.0" "22.5.1"
        "22.6.0" "22.7.0" "22.8.0" "22.9.0" "22.10.0" {
  auto-version {
    github-release = "nodejs/node"
    ignore-invalid-versions = true
    version-pattern = "v(22.*)"
  }
}

channel "lts" {
  version = "20.*"
  update = "168h"
}

channel "current" {
  version = "22.*"
  update = "24h"
}

sha256sums = {
  "https://nodejs.org/dist/v12.18.3/node-v12.18.3-darwin-x64.tar.gz": "af376caf114bdd5d7e566dbf7590e9077ffc01f9b2692eb2651f31d7219a30bb",
  "https://nodejs.org/dist/v12.18.3/node-v12.18.3-linux-x64.tar.gz": "8cdacecc43c35bcfa5474c793b9e7a01835e4171264f7b13f3e57093371872e9",
  "https://nodejs.org/dist/v12.22.12/node-v12.22.12-darwin-x64.tar.gz": "32927913ed549ce01685a6f9f4697567a64592c7fd1e9a845ac8a10efa1475e6",
  "https://nodejs.org/dist/v12.22.12/node-v12.22.12-linux-x64.tar.gz": "ff92a45c4d03e8e270bec1ab337b8fff6e9de293dabfe7e8936a41f2fb0b202e",
  "https://nodejs.org/dist/v12.22.6/node-v12.22.6-darwin-x64.tar.gz": "2124e9e17bf6b81ad579223f8efff537238c9cace17721e60614c5091f00e2d1",
  "https://nodejs.org/dist/v12.22.6/node-v12.22.6-linux-x64.tar.gz": "6e5ce9cc7dcd31b182730cd662b1813c201fa98089e1013db4abd141716852dc",
  "https://nodejs.org/dist/v12.22.7/node-v12.22.7-darwin-x64.tar.gz": "4fa5bdee2ac420f8043b800c4789929b09e4a5226dfd5fa7162e53939c594eae",
  "https://nodejs.org/dist/v12.22.7/node-v12.22.7-linux-x64.tar.gz": "0c650e494a0ce293fb1220cc81ab5b6b819c249439c392b5ee2e8b812eec5592",
  "https://nodejs.org/dist/v12.22.9/node-v12.22.9-darwin-x64.tar.gz": "92cc54a86e7a52016c1cd0bbda5d3c857b37795340292d9c547b1c5f4373a2a5",
  "https://nodejs.org/dist/v12.22.9/node-v12.22.9-linux-x64.tar.gz": "860c481f0e7963cbe5afa669d9e5deefa773fb67da571823945ac79a3ea76d3c",
  "https://nodejs.org/dist/v14.16.0/node-v14.16.0-darwin-x64.tar.gz": "14ec767e376d1e2e668f997065926c5c0086ec46516d1d45918af8ae05bd4583",
  "https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.gz": "7212031d7468718d7c8f5e1766380daaabe09d54611675338e7a88a97c3e31b6",
  "https://nodejs.org/dist/v14.17.0/node-v14.17.0-darwin-x64.tar.gz": "7b210652e11d1ee25650c164cf32381895e1dcb3e0ff1d0841d8abc1f47ac73e",
  "https://nodejs.org/dist/v14.17.0/node-v14.17.0-linux-x64.tar.gz": "3d06eabc73ec8626337bff370474306eac1c3c21122f677720d154c556ceafaf",
  "https://nodejs.org/dist/v14.17.3/node-v14.17.3-darwin-x64.tar.gz": "522f85db1d1fe798cba5f601d1bba7b5203ca8797b2bc934ff6f24263f0b7fb2",
  "https://nodejs.org/dist/v14.17.3/node-v14.17.3-linux-x64.tar.gz": "7ef1f7dae52a3ec99cda9cf29e655bc6e61c2c48e496532d83d9f17ea108d5d8",
  "https://nodejs.org/dist/v14.18.0/node-v14.18.0-darwin-x64.tar.gz": "6b9b4d60bcb4eba95488380be8c4da4af98fce3f4a01c9a76db881cbb736656d",
  "https://nodejs.org/dist/v14.18.0/node-v14.18.0-linux-x64.tar.gz": "f411b8aee36d6dc6a5435906f42bd4ea59d6f678894cf562beaf115b58a318ee",
  "https://nodejs.org/dist/v14.19.0/node-v14.19.0-darwin-x64.tar.gz": "e4ece4481b948c95f28662e74fc738ad03e07e877d9c9a47e59b4eb099aa1449",
  "https://nodejs.org/dist/v14.19.0/node-v14.19.0-linux-x64.tar.gz": "223ca31e3440b79a3fe6828161b1843743eaa7610a88c0e1ac1d8e1d815b44cd",
  "https://nodejs.org/dist/v14.19.2/node-v14.19.2-darwin-x64.tar.gz": "1e80fca29e6876c0312bec825d99a90a562b5501c4d25bf081665b6433c30abf",
  "https://nodejs.org/dist/v14.19.2/node-v14.19.2-linux-x64.tar.gz": "fd72086a1849a428c99d94ef1aca94686c9080792e1586a75ca031a030424544",
  "https://nodejs.org/dist/v14.21.0/node-v14.21.0-darwin-x64.tar.gz": "027d7e5999ed890d658e87f96a5edb7d9a8f26ee67e732f632a7adb850c43b70",
  "https://nodejs.org/dist/v14.21.0/node-v14.21.0-linux-x64.tar.gz": "ac808106e79f90bbb0ceb44c5c9c57306117f21d962f0ca54a58993266c514dc",
  "https://nodejs.org/dist/v15.10.0/node-v15.10.0-darwin-x64.tar.gz": "45ccf8dc5ac539a4f965313593510970a992e5f5dcf8cfacaebec0f99fd546be",
  "https://nodejs.org/dist/v15.10.0/node-v15.10.0-linux-x64.tar.gz": "31554d9b2de47948a364a007031c635d3943c303e50703b5f4c41a5eead07737",
  "https://nodejs.org/dist/v16.1.0/node-v16.1.0-darwin-arm64.tar.gz": "4ed9f6d78528fc80997a02a461437a3c3e82ba530fe8338ecf970e733883f8a8",
  "https://nodejs.org/dist/v16.1.0/node-v16.1.0-darwin-x64.tar.gz": "22525ecc3b91f4d9a5d44dffe061cdb23f1a3e4a5555552e7940987883a93547",
  "https://nodejs.org/dist/v16.1.0/node-v16.1.0-linux-x64.tar.gz": "50dadc0c130ff7d079d0fb4a86e40756c76edb3cd3b42b8cf2a57497116695fa",
  "https://nodejs.org/dist/v16.10.0/node-v16.10.0-darwin-arm64.tar.gz": "dfdaf4149365e170929b99692520388e89f618e8d64ddd3ded7126bccf4583ed",
  "https://nodejs.org/dist/v16.10.0/node-v16.10.0-darwin-x64.tar.gz": "66a42483908aabd6d5fb19e9f3cebd6927dc84206b75b8801d9e010815083906",
  "https://nodejs.org/dist/v16.10.0/node-v16.10.0-linux-x64.tar.gz": "bca7f42ea3e61938cc28868614bb37908111b9ff190fe8022fa9954651b5665d",
  "https://nodejs.org/dist/v16.11.0/node-v16.11.0-darwin-arm64.tar.gz": "b8f75887d6e94f8f38df9b6016258ea742677ffb45e6d513d55dc09bcd9c1fd3",
  "https://nodejs.org/dist/v16.11.0/node-v16.11.0-darwin-x64.tar.gz": "abcf083d1c5f83c6d12fbe0f0ff2b3ff61fc0d3e06b43ebbbd0761804c62c468",
  "https://nodejs.org/dist/v16.11.0/node-v16.11.0-linux-x64.tar.gz": "bfc84faaa07864398edbe8bfb9d7d0e64fa20649b8c498cd299e0ff44657d9a3",
  "https://nodejs.org/dist/v16.13.0/node-v16.13.0-darwin-arm64.tar.gz": "46d83fc0bd971db5050ef1b15afc44a6665dee40bd6c1cbaec23e1b40fa49e6d",
  "https://nodejs.org/dist/v16.13.0/node-v16.13.0-darwin-x64.tar.gz": "37e09a8cf2352f340d1204c6154058d81362fef4ec488b0197b2ce36b3f0367a",
  "https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.gz": "589b7e7eb22f8358797a2c14a0bd865459d0b44458b8f05d2721294dacc7f734",
  "https://nodejs.org/dist/v16.13.1/node-v16.13.1-darwin-arm64.tar.gz": "2d27c10c49af87a8d87bce4d32ca0e37afbc8dcc73d524ec7de3506c6309d4fc",
  "https://nodejs.org/dist/v16.13.1/node-v16.13.1-darwin-x64.tar.gz": "a139fc6a4c8daf160989420535378d69b53a0d9f5ae43871e9befeb2b8a44187",
  "https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.gz": "5f80197d654fd0b749cdeddf1f07a5eac1fcf6b423a00ffc8f2d3bea9c6dc8d1",
  "https://nodejs.org/dist/v16.14.0/node-v16.14.0-darwin-arm64.tar.gz": "56e547d22bc7be8aa40c8cfd604c156a5bcf8692f643ec1801c1fa2390498542",
  "https://nodejs.org/dist/v16.14.0/node-v16.14.0-darwin-x64.tar.gz": "26702ab17903ad1ea4e13133bd423c1176db3384b8cf08559d385817c9ca58dc",
  "https://nodejs.org/dist/v16.14.0/node-v16.14.0-linux-x64.tar.gz": "2c69e7b040c208b61ebf9735c63d2e5bcabfed32ef05a9b8dd5823489ea50d6b",
  "https://nodejs.org/dist/v16.14.1/node-v16.14.1-darwin-arm64.tar.gz": "8f6d45796f3d996484dcf53bb0e53cd019cd0ef7a1a247bd0178ebaa7e63a184",
  "https://nodejs.org/dist/v16.14.1/node-v16.14.1-darwin-x64.tar.gz": "af35abd727b051c8cdb8dcda9815ae93f96ef2c224d71f4ec52034a2ab5d8b61",
  "https://nodejs.org/dist/v16.14.1/node-v16.14.1-linux-x64.tar.gz": "8db3d6d8ecfc2af932320fb12449de2b5b76f946ac72b47c6a9074afe82737ff",
  "https://nodejs.org/dist/v16.15.0/node-v16.15.0-darwin-arm64.tar.gz": "ad8d8fc5330ef47788f509c2af398c8060bb59acbe914070d0df684cd2d8d39b",
  "https://nodejs.org/dist/v16.15.0/node-v16.15.0-darwin-x64.tar.gz": "a6bb12bbf979d32137598e49d56d61bcddf8a8596c3442b44a9b3ace58dd4de8",
  "https://nodejs.org/dist/v16.15.0/node-v16.15.0-linux-x64.tar.gz": "d1c1de461be10bfd9c70ebae47330fb1b4ab0a98ad730823fb1340e34993edee",
  "https://nodejs.org/dist/v16.17.0/node-v16.17.0-darwin-arm64.tar.gz": "96eefac1e168ec1bf39c5ae1e7b2760522624adfbe2e0c92875cd33ef9a07792",
  "https://nodejs.org/dist/v16.17.0/node-v16.17.0-darwin-x64.tar.gz": "b85eaa537f9d60a68c704e23839db65b5a75f14b37d6855c5d4e31a6bcef26c6",
  "https://nodejs.org/dist/v16.17.0/node-v16.17.0-linux-x64.tar.gz": "4827808e50b8ee42b4dadf056835287dac267b9cff56cea56e70843bf8cecb79",
  "https://nodejs.org/dist/v16.17.1/node-v16.17.1-darwin-arm64.tar.gz": "f9f02f7872e2e8ee54320fce13deb9d56904f32bb0615b6e21aa3371d8899150",
  "https://nodejs.org/dist/v16.17.1/node-v16.17.1-darwin-x64.tar.gz": "3db26761ad8493b894d42260d7e65094b7af9bc473588739e61bc1c32d6ff955",
  "https://nodejs.org/dist/v16.17.1/node-v16.17.1-linux-x64.tar.gz": "da5658693243b3ecf6a4cba6751a71df1eb9e9703ca93b42a9404aed85f58ad0",
  "https://nodejs.org/dist/v16.18.0/node-v16.18.0-darwin-arm64.tar.gz": "8ceee891d0171381520e9017326589a9a616d6be2689493304970290d9b6e3b2",
  "https://nodejs.org/dist/v16.18.0/node-v16.18.0-darwin-x64.tar.gz": "bd1476e95856879710026a344572c1b77add48da0f2d15bda48513d0b2667ed5",
  "https://nodejs.org/dist/v16.18.0/node-v16.18.0-linux-x64.tar.gz": "faca6476cb5b41aa995370fd856d16fcfbbef5c18718a6fa44cc1bae4140849d",
  "https://nodejs.org/dist/v16.18.1/node-v16.18.1-darwin-arm64.tar.gz": "71720bb0a80cf158d8fdf492def08048befd953ad45e2458b1d095e32c612ba7",
  "https://nodejs.org/dist/v16.18.1/node-v16.18.1-darwin-x64.tar.gz": "c190e106d4ac6177d1db3a5a739d39dd68bd276ba17f3d3c84039a93717e081e",
  "https://nodejs.org/dist/v16.18.1/node-v16.18.1-linux-x64.tar.gz": "8949919fc52543efae3bfd057261927c616978614926682ad642915f98fe1981",
  "https://nodejs.org/dist/v16.19.0/node-v16.19.0-darwin-arm64.tar.gz": "5c9434fbb0f323fecf3d261b23a2e544919380c5043d0046d9745682fefd9cde",
  "https://nodejs.org/dist/v16.19.0/node-v16.19.0-darwin-x64.tar.gz": "491e5a5592eca1961dcbb1fae28567428ce56ce9cc7977b04041e163e0c1670c",
  "https://nodejs.org/dist/v16.19.0/node-v16.19.0-linux-x64.tar.gz": "23770ba26a52cb8fedd1096613bbc419b8a033d774a457d9024bb5a0159f3585",
  "https://nodejs.org/dist/v16.19.1/node-v16.19.1-darwin-arm64.tar.gz": "168f787f457bf645f3fc41e7419b62071db7d42519ce461b1d7ebfc0acbdbfb1",
  "https://nodejs.org/dist/v16.19.1/node-v16.19.1-darwin-x64.tar.gz": "d7f683b2a8f78db8a28235a175e130c760f0d3cd335404e02f223e3a9adc30c7",
  "https://nodejs.org/dist/v16.19.1/node-v16.19.1-linux-x64.tar.gz": "ca63da538e02de15b7e974f7a17ce4732cc0d63023942301d30044c472ed9ddd",
  "https://nodejs.org/dist/v16.2.0/node-v16.2.0-darwin-arm64.tar.gz": "451d87c07c522e24152a584b2d5461d4e3a7c690bd8882bef9ae8bf6b19d1dfd",
  "https://nodejs.org/dist/v16.2.0/node-v16.2.0-darwin-x64.tar.gz": "3fc49b69de9491b45491f880217f8220d489b28ba3c1fff53e849dcf3ad77343",
  "https://nodejs.org/dist/v16.2.0/node-v16.2.0-linux-x64.tar.gz": "c3fd89a768e40a2fd8008919100bd283e6e9aec742eddeb1d494eb2a626466dc",
  "https://nodejs.org/dist/v16.20.0/node-v16.20.0-darwin-arm64.tar.gz": "15d0857009f13e85057010b605e57b418318fdf422b5f9dd7e0ef32115da9c10",
  "https://nodejs.org/dist/v16.20.0/node-v16.20.0-darwin-x64.tar.gz": "263d5b4871972028e204087fc8a67e21d8a0e2a420d1247375089ec8fd12759e",
  "https://nodejs.org/dist/v16.20.0/node-v16.20.0-linux-x64.tar.gz": "7abc0e558fa3b3c4cc0fd3c7fa5dbe61500ba7213f5e87ed560c65a733c6a5c4",
  "https://nodejs.org/dist/v16.20.1/node-v16.20.1-darwin-arm64.tar.gz": "5f6b31c5a75567d382ba67220f3d7a2d9bb0c03d8af9307cd35a9cb32a6fde9d",
  "https://nodejs.org/dist/v16.20.1/node-v16.20.1-darwin-x64.tar.gz": "d1f9c2a7c3a0fe09860f701af5fb8ff9ac72d72faa7ebabfeb5794503e79f955",
  "https://nodejs.org/dist/v16.20.1/node-v16.20.1-linux-x64.tar.gz": "c76d2aabd2d02542505fd24e18876fb8515e23638531249277272def42ab54e3",
  "https://nodejs.org/dist/v16.20.2/node-v16.20.2-darwin-arm64.tar.gz": "6a5c4108475871362d742b988566f3fe307f6a67ce14634eb3fbceb4f9eea88c",
  "https://nodejs.org/dist/v16.20.2/node-v16.20.2-darwin-x64.tar.gz": "d7a46eaf2b57ffddeda16ece0d887feb2e31a91ad33f8774da553da0249dc4a6",
  "https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.gz": "c9193e6c414891694759febe846f4f023bf48410a6924a8b1520c46565859665",
  "https://nodejs.org/dist/v16.3.0/node-v16.3.0-darwin-arm64.tar.gz": "aeac294dbe54a4dfd222eedfbae704b185c40702254810e2c5917f6dbc80e017",
  "https://nodejs.org/dist/v16.3.0/node-v16.3.0-darwin-x64.tar.gz": "3e075bcfb6130dda84bfd04633cb228ec71e72d9a844c57efb7cfff130b4be89",
  "https://nodejs.org/dist/v16.3.0/node-v16.3.0-linux-x64.tar.gz": "86f6d06c05021ae73b51f57bb56569a2eebd4a2ecc0b881972a0572e465b5d27",
  "https://nodejs.org/dist/v16.4.0/node-v16.4.0-darwin-arm64.tar.gz": "771469be99d6af048d9b192cd7b338c68a4604e0fcc7f8804278c91b5ad3f74f",
  "https://nodejs.org/dist/v16.4.0/node-v16.4.0-darwin-x64.tar.gz": "95c81b54ea3069fcf230664d5d80b10e46f8fff5163644b7076fe48df13fc2fb",
  "https://nodejs.org/dist/v16.4.0/node-v16.4.0-linux-x64.tar.gz": "6fb7bc9aece48f2d94941c586ed5d541ac29c8981bc09585fcabe9e4b87d57fa",
  "https://nodejs.org/dist/v16.5.0/node-v16.5.0-darwin-arm64.tar.gz": "4296521e8b5d73d4c3b9b7f6f9f666e577342ea92a520f33040f1a252387d079",
  "https://nodejs.org/dist/v16.5.0/node-v16.5.0-darwin-x64.tar.gz": "b779bd40b7c9366adcbe4f9fd2afd9ee5f085e333200380b34d285eb32c121bc",
  "https://nodejs.org/dist/v16.5.0/node-v16.5.0-linux-x64.tar.gz": "837d76357d8622aac81a5b7f27ba0fd9556faa311a44254f1ffd26aaf42b052f",
  "https://nodejs.org/dist/v16.6.0/node-v16.6.0-darwin-arm64.tar.gz": "07720d1bc18dca0bb3abdcd3c2e4f39a7cb532ca7f56c48bd42a4233de7fcd89",
  "https://nodejs.org/dist/v16.6.0/node-v16.6.0-darwin-x64.tar.gz": "4dc28f83bc1165ae28c937458b7277b4af3ff8c6e61cccf2d9b87b4bfbcbffec",
  "https://nodejs.org/dist/v16.6.0/node-v16.6.0-linux-x64.tar.gz": "4658500d47ab2373b9c5ffb8256bd4e514b6326a6c8a9c6186105fba4de75548",
  "https://nodejs.org/dist/v16.6.1/node-v16.6.1-darwin-arm64.tar.gz": "8b766a2bcc686f968146b09892f24cfbeaebb547a4d50744d9af80def5221613",
  "https://nodejs.org/dist/v16.6.1/node-v16.6.1-darwin-x64.tar.gz": "bca84deb7bf6c57537b3af44997d985045c95b5048fc5665cdc7f54d5c147516",
  "https://nodejs.org/dist/v16.6.1/node-v16.6.1-linux-x64.tar.gz": "e7e4149626ccd0653783ee8aef81eb50fa7ada2f9f7cbc031969b3b1ac3ffa6b",
  "https://nodejs.org/dist/v16.6.2/node-v16.6.2-darwin-arm64.tar.gz": "29e46e83f6837ff1c815c49f590c25fa51b0811a6590c62120a9d464ba431fc6",
  "https://nodejs.org/dist/v16.6.2/node-v16.6.2-darwin-x64.tar.gz": "74e95aca0ea88ed2d9270dccc1e3e62500912be5fef1528bb11f178c468f312c",
  "https://nodejs.org/dist/v16.6.2/node-v16.6.2-linux-x64.tar.gz": "913913f62416b96dee5f463b54e1adebaf669dd2ff3b047d6290deadc3003d97",
  "https://nodejs.org/dist/v16.7.0/node-v16.7.0-darwin-arm64.tar.gz": "969875c1a6b2790663d7b25d7641d1e3919225659921a98d2f1e4711bbec5ef3",
  "https://nodejs.org/dist/v16.7.0/node-v16.7.0-darwin-x64.tar.gz": "c9bf23c765c584f635a4065d58dadff9737aeb605676d1e45873eba66adaab8a",
  "https://nodejs.org/dist/v16.7.0/node-v16.7.0-linux-x64.tar.gz": "13a15e1934d356c9e8f97fcfff411d7d5236e90ed04d6aeeca5f10f529b58a57",
  "https://nodejs.org/dist/v16.8.0/node-v16.8.0-darwin-arm64.tar.gz": "891e72d166abbb1b838b5113cc8cfaf2fe905dfe77afe84a5af56e426ff74ddf",
  "https://nodejs.org/dist/v16.8.0/node-v16.8.0-darwin-x64.tar.gz": "9c013cb82830ab5adb9630ff28046f420a7805bb4a930ec2b3f5b162c5f6de88",
  "https://nodejs.org/dist/v16.8.0/node-v16.8.0-linux-x64.tar.gz": "aa1f366b522a9565332096fdc32ed0cd58a2049c0875d839703d3fe58b4c226d",
  "https://nodejs.org/dist/v16.9.0/node-v16.9.0-darwin-arm64.tar.gz": "13105eb6623f474e4596c725bd4d6fcd500c68155f9f954bd3332c46f5df7378",
  "https://nodejs.org/dist/v16.9.0/node-v16.9.0-darwin-x64.tar.gz": "37cea8ce6f88c501ed2ed191fc4335e5c4ecbeb0e85247c07b35825f07a60351",
  "https://nodejs.org/dist/v16.9.0/node-v16.9.0-linux-x64.tar.gz": "f7389d3bc9efdf5ce95ff52ea880efcbf2c9de662ef7b143aedf141aeb74ab95",
  "https://nodejs.org/dist/v16.9.1/node-v16.9.1-darwin-arm64.tar.gz": "cf7ec489e2250e9837cb608cb14123ea6645b14943dbfdc9de206d62f0de6fa2",
  "https://nodejs.org/dist/v16.9.1/node-v16.9.1-darwin-x64.tar.gz": "90ff3ce95882ad41ae5c7a2f4f7303e9ba445caf5ef41d270a385c0a76e43bc6",
  "https://nodejs.org/dist/v16.9.1/node-v16.9.1-linux-x64.tar.gz": "1d48c69e4141792f314d29f081501dc22218cfc22f9992c098f7e3f5e0531139",
  "https://nodejs.org/dist/v17.0.0/node-v17.0.0-darwin-arm64.tar.gz": "bba3a1d2638ee194f82a6173296bebabf1b28897a5cd41bbc146629ac05e0751",
  "https://nodejs.org/dist/v17.0.0/node-v17.0.0-darwin-x64.tar.gz": "091f29119bfb2a9004171f4626e0e76021f7f8db07148bd45caa6a61eb2a4e3d",
  "https://nodejs.org/dist/v17.0.0/node-v17.0.0-linux-x64.tar.gz": "252505ade312c6c346c6b8d00e2be9e383446d81430ee4c1e5a04972e0817da4",
  "https://nodejs.org/dist/v17.0.1/node-v17.0.1-darwin-arm64.tar.gz": "b49c65be9112f7e5de4e39f4f01e541ee73b3d28d3e2bbd3ea85a86952d0dc2d",
  "https://nodejs.org/dist/v17.0.1/node-v17.0.1-darwin-x64.tar.gz": "0dfe6f904f3f20652e3d34c60885b790603f120d5d51a53031355827a4eaf6a9",
  "https://nodejs.org/dist/v17.0.1/node-v17.0.1-linux-x64.tar.gz": "c2aaef730245ad180d2a2b9d2d2806feca57e93e0691faabb41175d26bed9c89",
  "https://nodejs.org/dist/v17.1.0/node-v17.1.0-darwin-arm64.tar.gz": "5e89e1cd17c58ef795d3bb420dd2a473c72a642422328c66dec59eb6d9243408",
  "https://nodejs.org/dist/v17.1.0/node-v17.1.0-darwin-x64.tar.gz": "5255978096ea249a8b155f6cc7f8f81e3bc2f7e9371c9f263bdb484359d740b2",
  "https://nodejs.org/dist/v17.1.0/node-v17.1.0-linux-x64.tar.gz": "54b387bb1b6faa436d73777343a1a2147e67ff5e33a80971df2fd030dde4fd24",
  "https://nodejs.org/dist/v17.3.0/node-v17.3.0-darwin-arm64.tar.gz": "b504ba3628337f7ac2c67d04bf30e56082942345aa1a50e0e464f51df6662ff3",
  "https://nodejs.org/dist/v17.3.0/node-v17.3.0-darwin-x64.tar.gz": "d4fa7d01c3b08cecdb71eee1da27a5e0e2d31bd25ad3bee1807df95811c2ce3f",
  "https://nodejs.org/dist/v17.3.0/node-v17.3.0-linux-x64.tar.gz": "479fb0b4b6405fb7240376187e2823cf384635a4998bdbaddc3ea826b63c8c74",
  "https://nodejs.org/dist/v17.3.1/node-v17.3.1-darwin-arm64.tar.gz": "e664dd753777c813d893aad2b797847e2f0dc4c537cfefc377e3c88716934d38",
  "https://nodejs.org/dist/v17.3.1/node-v17.3.1-darwin-x64.tar.gz": "a5d08b39a3f4af25c512247a2604eb84ffd41cbf66426d91df6ef165be94ae08",
  "https://nodejs.org/dist/v17.3.1/node-v17.3.1-linux-x64.tar.gz": "7fd238a05ce8c98b19e6799103d12619f16bbab7111a6719f57b7ef190b74cfa",
  "https://nodejs.org/dist/v17.4.0/node-v17.4.0-darwin-arm64.tar.gz": "9bd53805faf6df658ecd4f54321b25eff89818efdcb52c20435ff1703fd7064c",
  "https://nodejs.org/dist/v17.4.0/node-v17.4.0-darwin-x64.tar.gz": "27e24d9f7a9a83bb59353249cce7cff16067e0483a627b5b9a1f1478101e64ee",
  "https://nodejs.org/dist/v17.4.0/node-v17.4.0-linux-x64.tar.gz": "132c61652c315a6f784167b97a53e9638bac45853f1544a84d4cbb90fe7a3bda",
  "https://nodejs.org/dist/v17.5.0/node-v17.5.0-darwin-arm64.tar.gz": "b5b5d8557d1556cc8224e0e0b0711b6baba79be74b22e6eaf9870ac71fcd757a",
  "https://nodejs.org/dist/v17.5.0/node-v17.5.0-darwin-x64.tar.gz": "c5863c6ecdd6a3a1d14ef5d75135a82d33b68afb7a6a47558b86c72463d26877",
  "https://nodejs.org/dist/v17.5.0/node-v17.5.0-linux-x64.tar.gz": "86fabd8177686b5f2f4ec8ac81e88a008b74a34e789080188f1c13f5d665ca6e",
  "https://nodejs.org/dist/v17.6.0/node-v17.6.0-darwin-arm64.tar.gz": "801ec54f30e43c0513aa390b0a5e67afd2287c3bd81861afa744df6e7e8c109f",
  "https://nodejs.org/dist/v17.6.0/node-v17.6.0-darwin-x64.tar.gz": "0a88e772b11eb0145272ee70bf2785f1c159ce6783237dc7b4f865ce97c8f916",
  "https://nodejs.org/dist/v17.6.0/node-v17.6.0-linux-x64.tar.gz": "de9596fda9cc88451d03146278806687e954c03413e8aa0ee98ad46442d6cb1c",
  "https://nodejs.org/dist/v17.7.0/node-v17.7.0-darwin-arm64.tar.gz": "4badbaf77e80cdc7333fdddbfaea80bf019adc4d09f71378ffa7e903eebd3b33",
  "https://nodejs.org/dist/v17.7.0/node-v17.7.0-darwin-x64.tar.gz": "6cf672f1b26105ea42f36f6834fb1a7ede86f6a39aee497e69e1dd319775b1fc",
  "https://nodejs.org/dist/v17.7.0/node-v17.7.0-linux-x64.tar.gz": "c807f2e7c08882a2005fce8db0820b810b2bcc4b6a872faa15fb2af193500d62",
  "https://nodejs.org/dist/v17.7.1/node-v17.7.1-darwin-arm64.tar.gz": "d5bb0974a881e017a178b33dab1e90d1fe1e183602d1e86b62fed1e2ea1960a6",
  "https://nodejs.org/dist/v17.7.1/node-v17.7.1-darwin-x64.tar.gz": "94bfec7b7c034da3b626de77b9c8e6ba26418b160e805fc8a8106fbb0b797355",
  "https://nodejs.org/dist/v17.7.1/node-v17.7.1-linux-x64.tar.gz": "a88875ba97a71f77fc85890897d23bb7bbb2097bed6de5d40cca52b7b67f79d3",
  "https://nodejs.org/dist/v17.7.2/node-v17.7.2-darwin-arm64.tar.gz": "9b078739799239adb3a0aea051e3cf60be886f28bb39d34d75780297dddd7af1",
  "https://nodejs.org/dist/v17.7.2/node-v17.7.2-darwin-x64.tar.gz": "57be6ba9e505c6b4b3b59c2878a1679fa11c1160773ec2d082cff74ed79e5ea1",
  "https://nodejs.org/dist/v17.7.2/node-v17.7.2-linux-x64.tar.gz": "7865d88b7a07ec407ceb9a3a9aa92a1c5a07469885834a5ee56661de369a9e40",
  "https://nodejs.org/dist/v17.8.0/node-v17.8.0-darwin-arm64.tar.gz": "b0bdcddc070a559018f876e0810a678415f99d69ed6e4df15fd1c7cf5fc2e45f",
  "https://nodejs.org/dist/v17.8.0/node-v17.8.0-darwin-x64.tar.gz": "f253b705284f35f3ccea03ed7b97b8d5bd8002cfea3bb734289e2e9b38d0844b",
  "https://nodejs.org/dist/v17.8.0/node-v17.8.0-linux-x64.tar.gz": "02d3e21362ae3cf670fa4b12c6b982e2544a815a007ea96f881b89f305843dfe",
  "https://nodejs.org/dist/v17.9.0/node-v17.9.0-darwin-arm64.tar.gz": "bad50341f8a1fd737c53efc01aa3f4eaf63df5601adf9ba036a8adb695d13428",
  "https://nodejs.org/dist/v17.9.0/node-v17.9.0-darwin-x64.tar.gz": "0920116e6507fdc8dcf16bdd717e08797b6d1b97a7a6990294bbf62da9471256",
  "https://nodejs.org/dist/v17.9.0/node-v17.9.0-linux-x64.tar.gz": "8c9f4c95c254336fcb2c768e746f4316b8176adc0fb599cbbb460d0933991d12",
  "https://nodejs.org/dist/v17.9.1/node-v17.9.1-darwin-arm64.tar.gz": "d6add5bbe10203a76d9ed964a2e5075a45aaf76137dbf3ee772fe6a679a34f36",
  "https://nodejs.org/dist/v17.9.1/node-v17.9.1-darwin-x64.tar.gz": "ef8ef450425db95a1e91c1dd4bc6d05ca40bbbbdab9a71f59c5a02e13cc039fb",
  "https://nodejs.org/dist/v17.9.1/node-v17.9.1-linux-x64.tar.gz": "efa39656f3a9761b5696dbd68efdff3a9be3ce00004171be53250a8a6f120272",
  "https://nodejs.org/dist/v18.0.0/node-v18.0.0-darwin-arm64.tar.gz": "35c05023a5d1ca647e2364e7383b6cf6299e8fed648b03597ca9be52ed0c4d59",
  "https://nodejs.org/dist/v18.0.0/node-v18.0.0-darwin-x64.tar.gz": "cf94dd0dc95574775769de7ed7cea5a44a99bb813ab786fb90f764c17555b505",
  "https://nodejs.org/dist/v18.0.0/node-v18.0.0-linux-x64.tar.gz": "6260d3526dff25d43451ea8e90e0174975b4cd067e8535dc1d85a6d6b29f3043",
  "https://nodejs.org/dist/v18.1.0/node-v18.1.0-darwin-arm64.tar.gz": "8bc7b56fb7660dac5e981fd8724b95414fb52f698e8ce87dda92a683e5d2f4fa",
  "https://nodejs.org/dist/v18.1.0/node-v18.1.0-darwin-x64.tar.gz": "2f1809e5e9cbda9c271051351a62d9d60e893bbb85f8810c815be03d121ee58c",
  "https://nodejs.org/dist/v18.1.0/node-v18.1.0-linux-x64.tar.gz": "db3819510007d29516cb45aa65a7cd967de917e40c176bb60de6c3d0cd6440af",
  "https://nodejs.org/dist/v18.10.0/node-v18.10.0-darwin-arm64.tar.gz": "0689815cdd69a9a977ee3bab20c6228d03966a1f988464f18ce490678dc5cdc3",
  "https://nodejs.org/dist/v18.10.0/node-v18.10.0-darwin-x64.tar.gz": "06b1b6381dfa952ae95fc927b740b660bc08f26bcf02cad61f64b36485dab6d4",
  "https://nodejs.org/dist/v18.10.0/node-v18.10.0-linux-x64.tar.gz": "f468b86031cca41ee9aa7a911e70eb624413153c7432754cbe9206c7ef3de090",
  "https://nodejs.org/dist/v18.11.0/node-v18.11.0-darwin-arm64.tar.gz": "db5f8d16967d8b04129d77013101c9b0bb8a3b98e5895cf4bfd9a9af21ff8e27",
  "https://nodejs.org/dist/v18.11.0/node-v18.11.0-darwin-x64.tar.gz": "3d3a4368c35f0bce45b1dc2eeb0b25765afee8a188441a81db93d16bc08bb861",
  "https://nodejs.org/dist/v18.11.0/node-v18.11.0-linux-x64.tar.gz": "5935236185a515b4beb991baabbe0084d552eb5122ab9b3fd0fad018af795cb3",
  "https://nodejs.org/dist/v18.12.0/node-v18.12.0-darwin-arm64.tar.gz": "7aa5ef109086be0adf433b851504f0522a71a02c6d675e729375cd591a854f3c",
  "https://nodejs.org/dist/v18.12.0/node-v18.12.0-darwin-x64.tar.gz": "cb3ca15bec3e5732a82bf321af30da8105f61df3934c0e79e6d3e54f84ca7913",
  "https://nodejs.org/dist/v18.12.0/node-v18.12.0-linux-x64.tar.gz": "0699c8e02581a9c312d7157331561d36ef23963766eb47daa702edb6fd6735bd",
  "https://nodejs.org/dist/v18.12.1/node-v18.12.1-darwin-arm64.tar.gz": "9857042e18a0530a19f22f29a38de4fed5608e32543216f9afb6edea8d0dfdd3",
  "https://nodejs.org/dist/v18.12.1/node-v18.12.1-darwin-x64.tar.gz": "90ac0e8148f3fb52bcfc01d9f7d7963ce565dd0add0cd8d3e0698fbd7ecf1e5a",
  "https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.tar.gz": "a8fcacb8033504e6d704bdee821f7005ee3774db25c799bcf2a13b5bda7de172",
  "https://nodejs.org/dist/v18.13.0/node-v18.13.0-darwin-arm64.tar.gz": "418d535e64dbcbd628715180c2de4ffcecb8a84b81f233c60e6ab9f0d795c249",
  "https://nodejs.org/dist/v18.13.0/node-v18.13.0-darwin-x64.tar.gz": "8b57c4da4ff6cca19d5ef7953f8816e3406d1508a2e4ee7f997984b3b1d11b77",
  "https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.gz": "2d2881cf860624b9fa9866670a65708c747d458213bdccaa8e7266b105d404ad",
  "https://nodejs.org/dist/v18.14.0/node-v18.14.0-darwin-arm64.tar.gz": "514438c258ee87e3083c21359f6d5e84988946db8a5ed5fa8bb0485276ea99f0",
  "https://nodejs.org/dist/v18.14.0/node-v18.14.0-darwin-x64.tar.gz": "274a62f2f1c21e6216a9be1445c53ef63814db4a3ffeea8028b507fb6453c0ac",
  "https://nodejs.org/dist/v18.14.0/node-v18.14.0-linux-x64.tar.gz": "bcdfd28bb7ab9a53c7045e0862556f77c250580c6d3d6cb960843895e024cac6",
  "https://nodejs.org/dist/v18.14.2/node-v18.14.2-darwin-arm64.tar.gz": "19f2e5f0659909e6f4b583fe581c0a5f14d079232f24093a55722d1bcf1b9991",
  "https://nodejs.org/dist/v18.14.2/node-v18.14.2-darwin-x64.tar.gz": "137fbd2abf59db87033a1114fab7afb497e3d747c3726dd881b6297d59782da2",
  "https://nodejs.org/dist/v18.14.2/node-v18.14.2-linux-x64.tar.gz": "95bdaaf92265eefd40d2055fb9b5cd6cbc3cb2c4495e3ebd4b1b501822d69731",
  "https://nodejs.org/dist/v18.15.0/node-v18.15.0-darwin-arm64.tar.gz": "bd302a689c3c34e2b61d86b97de66d26a335881a17af09b6a0a4bb1019df56e4",
  "https://nodejs.org/dist/v18.15.0/node-v18.15.0-darwin-x64.tar.gz": "76add174d2d3f98da08907412e82add7352b8cb6f639324d352a65c084b99c7e",
  "https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.gz": "b298a73a9fc07badfa9e4a2e86ed48824fc9201327cdc43e3f3f58b273c535e7",
  "https://nodejs.org/dist/v18.16.0/node-v18.16.0-darwin-arm64.tar.gz": "82c7bb4869419ce7338669e6739a786dfc7e72f276ffbed663f85ffc905dcdb4",
  "https://nodejs.org/dist/v18.16.0/node-v18.16.0-darwin-x64.tar.gz": "cd520da6e2e89fab881c66a3e9aff02cb0d61d68104b1d6a571dd71bef920870",
  "https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.gz": "fc83046a93d2189d919005a348db3b2372b598a145d84eb9781a3a4b0f032e95",
  "https://nodejs.org/dist/v18.16.1/node-v18.16.1-darwin-arm64.tar.gz": "2ccb24e9211f4d17d8d8cfc0ea521198bb6a54e2f779f8feda952dbd3bb651ac",
  "https://nodejs.org/dist/v18.16.1/node-v18.16.1-darwin-x64.tar.gz": "3040210287a0b8d05af49f57de191afa783e497abbb10c340bae9158cb51fdd4",
  "https://nodejs.org/dist/v18.16.1/node-v18.16.1-linux-x64.tar.gz": "59582f51570d0857de6333620323bdeee5ae36107318f86ce5eca24747cabf5b",
  "https://nodejs.org/dist/v18.17.0/node-v18.17.0-darwin-arm64.tar.gz": "19731ef427e77ad9c5f476eb62bfb02a7f179d3012feed0bbded62e45f23e679",
  "https://nodejs.org/dist/v18.17.0/node-v18.17.0-darwin-x64.tar.gz": "2f381442381f7fbde2ca644c3275bec9c9c2a8d361f467b40e39428acdd6ccff",
  "https://nodejs.org/dist/v18.17.0/node-v18.17.0-linux-x64.tar.gz": "5c4a7fd9262c0c47bafab3442de6c3fed1602be3d243cb8cf11309a201955e75",
  "https://nodejs.org/dist/v18.17.1/node-v18.17.1-darwin-arm64.tar.gz": "18ca716ea57522b90473777cb9f878467f77fdf826d37beb15a0889fdd74533e",
  "https://nodejs.org/dist/v18.17.1/node-v18.17.1-darwin-x64.tar.gz": "b3e083d2715f07ec3f00438401fb58faa1e0bdf3c7bde9f38b75ed17809d92fa",
  "https://nodejs.org/dist/v18.17.1/node-v18.17.1-linux-x64.tar.gz": "2cb75f2bc04b0a3498733fbee779b2f76fe3f655188b4ac69ef2887b6721da2d",
  "https://nodejs.org/dist/v18.18.0/node-v18.18.0-darwin-arm64.tar.gz": "b21a2e8a3e75f81eb6124ea463d67cf4648a04dce9062e8d5a1bc44c99606a15",
  "https://nodejs.org/dist/v18.18.0/node-v18.18.0-darwin-x64.tar.gz": "993e43ac4750609437a8523937a42663e5a7aa7973acac3f26b8d478aca1285d",
  "https://nodejs.org/dist/v18.18.0/node-v18.18.0-linux-x64.tar.gz": "8aae62b6b3a5d659459c35c51e4373b950d11595a273db16c6162c712c5533a2",
  "https://nodejs.org/dist/v18.18.1/node-v18.18.1-darwin-arm64.tar.gz": "e2b276e7a62cb4bd487211a185f84a94f012220f9e09d2ecd1f24de482c8f023",
  "https://nodejs.org/dist/v18.18.1/node-v18.18.1-darwin-x64.tar.gz": "b7237c9c8e6f7ec3a2c61158e9e5e96f1e19d54a1d1d0932b79fede24aa6de86",
  "https://nodejs.org/dist/v18.18.1/node-v18.18.1-linux-x64.tar.gz": "9ce4db11f1d8399f6b58aab6858a688b2e09405127b47ebc4594dc8262a5e29f",
  "https://nodejs.org/dist/v18.18.2/node-v18.18.2-darwin-arm64.tar.gz": "9f982cc91b28778dd8638e4f94563b0c2a1da7aba62beb72bd427721035ab553",
  "https://nodejs.org/dist/v18.18.2/node-v18.18.2-darwin-x64.tar.gz": "5bb8da908ed590e256a69bf2862238c8a67bc4600119f2f7721ca18a7c810c0f",
  "https://nodejs.org/dist/v18.18.2/node-v18.18.2-linux-x64.tar.gz": "a44c3e7f8bf91e852c928e5d8bd67ca316b35e27eec1d8acbe3b9dbe03688dab",
  "https://nodejs.org/dist/v18.19.0/node-v18.19.0-darwin-arm64.tar.gz": "8907c42a968765b77730fb319458d63ec4ed009265f8012097c3a052407aa99b",
  "https://nodejs.org/dist/v18.19.0/node-v18.19.0-darwin-x64.tar.gz": "0a749fcdf5d6bf46e1c17b3ea01e050b4d1ec3f3073b14aa745527b45a759c74",
  "https://nodejs.org/dist/v18.19.0/node-v18.19.0-linux-x64.tar.gz": "153312ae9fe8684f345100e4d141a521dc542b36d8c1e09c31ac290eae98c62a",
  "https://nodejs.org/dist/v18.19.1/node-v18.19.1-darwin-arm64.tar.gz": "0c7249318868877032ed21cc0ed450015ee44b31b9b281955521cd3fc39fbfa3",
  "https://nodejs.org/dist/v18.19.1/node-v18.19.1-darwin-x64.tar.gz": "ab67c52c0d215d6890197c951e1bd479b6140ab630212b96867395e21d813016",
  "https://nodejs.org/dist/v18.19.1/node-v18.19.1-linux-x64.tar.gz": "724802c45237477dbe5777923743e6c77906830cae03a82b5653ebd75b301dda",
  "https://nodejs.org/dist/v18.2.0/node-v18.2.0-darwin-arm64.tar.gz": "d140f15ca709767365e09edd0cb345f10f32f582d82d726f67f63dd7db4443d1",
  "https://nodejs.org/dist/v18.2.0/node-v18.2.0-darwin-x64.tar.gz": "0b03647ac5805df335c6601d1a1838c6a2f4edbed7d098982bfd39e71b5fd8f8",
  "https://nodejs.org/dist/v18.2.0/node-v18.2.0-linux-x64.tar.gz": "73d3f98e96e098587c2154dcaa82a6469a510e89a4881663dc4c86985acf245e",
  "https://nodejs.org/dist/v18.20.0/node-v18.20.0-darwin-arm64.tar.gz": "10066ad4dd9e03ea5c4c45ef8775420ff37b860de09bbdf87b97e0c07b1ea036",
  "https://nodejs.org/dist/v18.20.0/node-v18.20.0-darwin-x64.tar.gz": "062ba71618e88e06321de5caa038843c350aababa2d315f3ca7b8551f8e66c1c",
  "https://nodejs.org/dist/v18.20.0/node-v18.20.0-linux-x64.tar.gz": "80620426d177141aa99376de2ad1cb5ed461104cc53c0a5334df91467c60cac3",
  "https://nodejs.org/dist/v18.20.1/node-v18.20.1-darwin-arm64.tar.gz": "275ffd6e96ea38e0ce0db2a37950381102fc95d1ad863b360ba0889dc7190405",
  "https://nodejs.org/dist/v18.20.1/node-v18.20.1-darwin-x64.tar.gz": "87d6c6e5df6c4615ca90b044c75dc112473df4ebd55f6f471740c4e1c9602cbe",
  "https://nodejs.org/dist/v18.20.1/node-v18.20.1-linux-x64.tar.gz": "d226c39c5546dca97567db8f8ca7f92fca6572d44f181b1f85af83eee5d6f9e1",
  "https://nodejs.org/dist/v18.20.2/node-v18.20.2-darwin-arm64.tar.gz": "2647d831f16b3dc7857ed4ee721d3c378194918ecda80b9471590250d328fa3c",
  "https://nodejs.org/dist/v18.20.2/node-v18.20.2-darwin-x64.tar.gz": "e26d8074da6d22ed23140e0ba964cba9c694f9b839ce48835d692a7a7e36421e",
  "https://nodejs.org/dist/v18.20.2/node-v18.20.2-linux-x64.tar.gz": "a222595d353a7d1e48994a7d9c25e61ab1b8a1b0ce0652029f5cf999978b2e49",
  "https://nodejs.org/dist/v18.20.3/node-v18.20.3-darwin-arm64.tar.gz": "99328b985f7336a8fcfb62fda382155d210979fcca928e2dd75b7148d9bba636",
  "https://nodejs.org/dist/v18.20.3/node-v18.20.3-darwin-x64.tar.gz": "317a4607390c923610303e8583972e23fb656e9d348d3740bde0f1a94cdb7e0c",
  "https://nodejs.org/dist/v18.20.3/node-v18.20.3-linux-x64.tar.gz": "262bdd5d59608360cb872cdb3d2aa089867b46963ec7e6a000c1afc7d183db5c",
  "https://nodejs.org/dist/v18.20.4/node-v18.20.4-darwin-arm64.tar.gz": "aca5b568cc2a7e918037f05168634a921d88f43882c92a01b4ef5e39d0b89414",
  "https://nodejs.org/dist/v18.20.4/node-v18.20.4-darwin-x64.tar.gz": "7d2eb630b66bb39b9cf6bb12b35de833e2445797f2ddc9bcae714e63e75181ca",
  "https://nodejs.org/dist/v18.20.4/node-v18.20.4-linux-x64.tar.gz": "c4b0827dc47609d0a8379e6de6c74b3934da0b1312c733b5ebdcac16e3f1e954",
  "https://nodejs.org/dist/v18.3.0/node-v18.3.0-darwin-arm64.tar.gz": "5800be1084a61dbbe6748535c7f0aefa8bc9b2a5aeb6482916f4b7500d6fc892",
  "https://nodejs.org/dist/v18.3.0/node-v18.3.0-darwin-x64.tar.gz": "e4d4b81d08adbf34c40d46d4143ec1fab92372b459b466e9e6ec9a228a93badd",
  "https://nodejs.org/dist/v18.3.0/node-v18.3.0-linux-x64.tar.gz": "9b64ed313363872f83f6586ad985e793258c5ba6e569812b9dd349ec819956cf",
  "https://nodejs.org/dist/v18.4.0/node-v18.4.0-darwin-arm64.tar.gz": "90850d1ff13ef07e5ae2c8c2f29c29bd2654308def2776eb73be0f7aa6a4f9bd",
  "https://nodejs.org/dist/v18.4.0/node-v18.4.0-darwin-x64.tar.gz": "9d97b2efc0b7f1d0877c319f6c1b3da24c8c4218d4c4eab7d6ebee0d95f69701",
  "https://nodejs.org/dist/v18.4.0/node-v18.4.0-linux-x64.tar.gz": "4e3f5c72ec735aa23d52042be61e32e7279d26d7f05ebb5571c410e81d10c9a3",
  "https://nodejs.org/dist/v18.5.0/node-v18.5.0-darwin-arm64.tar.gz": "8d4012c137ba18d8a3e650c01f83d995235dcef87a65d2be55471594b33be52f",
  "https://nodejs.org/dist/v18.5.0/node-v18.5.0-darwin-x64.tar.gz": "bb72c852c249fde250418cd4dcef633d932e49414194aa25d199168e64207b77",
  "https://nodejs.org/dist/v18.5.0/node-v18.5.0-linux-x64.tar.gz": "deb4b0b8b82354a1b5087b724ab0d5861081302a12c0b204d799b31fea527eda",
  "https://nodejs.org/dist/v18.6.0/node-v18.6.0-darwin-arm64.tar.gz": "b68009204398118dd2806a96a9a4cec35f19c2ba454a325519e0f74ffb9c855e",
  "https://nodejs.org/dist/v18.6.0/node-v18.6.0-darwin-x64.tar.gz": "9a4ba2455fdb4f1fe8c07d0aa17ae8369dd4843855e4de8b9d6fc8bc50e473a9",
  "https://nodejs.org/dist/v18.6.0/node-v18.6.0-linux-x64.tar.gz": "eff59cd54fdcd24dc09965b41dc8d347ab4ce367b6c395fd983cfb4c3a542e03",
  "https://nodejs.org/dist/v18.7.0/node-v18.7.0-darwin-arm64.tar.gz": "ea24b35067bd0dc40ea8fda1087acc87672cbcbba881f7477dbd432e3c03343d",
  "https://nodejs.org/dist/v18.7.0/node-v18.7.0-darwin-x64.tar.gz": "ce95b924b450edbcfeaf422b3635a6b44b17ad23cd1f5efff6b051c60db548c8",
  "https://nodejs.org/dist/v18.7.0/node-v18.7.0-linux-x64.tar.gz": "0bef16a77faed5220c2ea1555f7bd19ea79bfbb848dba62fbe9d43eb1a36fce0",
  "https://nodejs.org/dist/v18.8.0/node-v18.8.0-darwin-arm64.tar.gz": "4952a8ec7ca07328571ba0b06d228c2a8220041a6f07df4f46765c341a80ccd4",
  "https://nodejs.org/dist/v18.8.0/node-v18.8.0-darwin-x64.tar.gz": "57457aeb1b3bfa2295235a134ebcdb58a72144b88049b72d9f7739f6591f850f",
  "https://nodejs.org/dist/v18.8.0/node-v18.8.0-linux-x64.tar.gz": "01c2060503bb42caa1c6cc2ee4b432f80c0b38ad46b4eed956774fb36302f46e",
  "https://nodejs.org/dist/v18.9.0/node-v18.9.0-darwin-arm64.tar.gz": "60300b40f539fc93005859fcb7ea585bfd111800e90b6ee744a07f2380512bbb",
  "https://nodejs.org/dist/v18.9.0/node-v18.9.0-darwin-x64.tar.gz": "dce1144cbfc01e03c2e84582461c3ce83541968b2b52a3d3a6f2bbfb09183fba",
  "https://nodejs.org/dist/v18.9.0/node-v18.9.0-linux-x64.tar.gz": "7fdbfdb985a48db3d22a2472330db05d94c9aff59192b09d8f9ab5fcedba76d5",
  "https://nodejs.org/dist/v18.9.1/node-v18.9.1-darwin-arm64.tar.gz": "289dca525c5535bddf389b69386ceb12d7c77eeae9aa2f666652877f982f9b5d",
  "https://nodejs.org/dist/v18.9.1/node-v18.9.1-darwin-x64.tar.gz": "ef7d92bb3b21b50242175483dca6ccd98052d6f4be3ce5b9ae55f0b95c0db25d",
  "https://nodejs.org/dist/v18.9.1/node-v18.9.1-linux-x64.tar.gz": "33ecf5f39618f4beb90a9be98880325cb4f06e33b52e315040a54fd0700f2434",
  "https://nodejs.org/dist/v19.0.0/node-v19.0.0-darwin-arm64.tar.gz": "e30054d93857d3b2f55d22a4305e379ba9544adea885428900ff57bae465435e",
  "https://nodejs.org/dist/v19.0.0/node-v19.0.0-darwin-x64.tar.gz": "a1b46d199bbc307f6ef8621b118e71356c626a279eb421c6b3ce7a7741573041",
  "https://nodejs.org/dist/v19.0.0/node-v19.0.0-linux-x64.tar.gz": "857f4dde358a8b23afab47ebdc685ae736bcfeac1258c2dddae3648f6a03a77a",
  "https://nodejs.org/dist/v19.0.1/node-v19.0.1-darwin-arm64.tar.gz": "96bcdf51e92320a79ada8ef9f97ab6eda8426e84fb2aad4b290719d8d749f4de",
  "https://nodejs.org/dist/v19.0.1/node-v19.0.1-darwin-x64.tar.gz": "55dffff4ef8e82c6e241d89fd124c7620dff83880c5e33c4ec2b19bd2d6399aa",
  "https://nodejs.org/dist/v19.0.1/node-v19.0.1-linux-x64.tar.gz": "7df29266d2cfd75b6e6ae59205476debac94848e29350378ece95701c13c32ee",
  "https://nodejs.org/dist/v19.1.0/node-v19.1.0-darwin-arm64.tar.gz": "d05a4a3c9f081c7fbab131f447714fa708328c5c1634c278716adfbdbae0ff26",
  "https://nodejs.org/dist/v19.1.0/node-v19.1.0-darwin-x64.tar.gz": "63f4284fa1474b779f0e4fa93985ddc2efa227484476f33d923ae44922637080",
  "https://nodejs.org/dist/v19.1.0/node-v19.1.0-linux-x64.tar.gz": "1a42a67beb3e07289da2ad22a58717801c6ab80d09668e2da6b1c537b2a80a5e",
  "https://nodejs.org/dist/v19.2.0/node-v19.2.0-darwin-arm64.tar.gz": "394341380de1b1c6e5a5ab8af86e08e8f097ba7d101d4315bdd7cdcf3b306467",
  "https://nodejs.org/dist/v19.2.0/node-v19.2.0-darwin-x64.tar.gz": "e3cfa8f82ea334c3c23bc1d9c9c3a87c4ffff8d29eab17e6bb9d53008103b08b",
  "https://nodejs.org/dist/v19.2.0/node-v19.2.0-linux-x64.tar.gz": "64cad7fb9ff6c0bc85b7f58275f23177a11c820240a0a7cb036e764a98c3527e",
  "https://nodejs.org/dist/v19.3.0/node-v19.3.0-darwin-arm64.tar.gz": "a50be904794d083fa8ecd4113845cea37968cbe3e5c1e758b0ec6215e1e7495e",
  "https://nodejs.org/dist/v19.3.0/node-v19.3.0-darwin-x64.tar.gz": "d9692a5f153d2527ec43860e40fa0e77825543f554384aa8d26d33417ffb9069",
  "https://nodejs.org/dist/v19.3.0/node-v19.3.0-linux-x64.tar.gz": "b525028ae5bb71b5b32cb7fce903ccce261dbfef4c7dd0f3e0ffc27cd6fc0b3f",
  "https://nodejs.org/dist/v19.4.0/node-v19.4.0-darwin-arm64.tar.gz": "9b6bfec4787ec5e500d21e835467fc4bb67689ef7d30a66e31d5bc372405eb42",
  "https://nodejs.org/dist/v19.4.0/node-v19.4.0-darwin-x64.tar.gz": "13ec36d26994432731c33a24b55e29a0137e688386adb3254f54ecdbb5ab19c7",
  "https://nodejs.org/dist/v19.4.0/node-v19.4.0-linux-x64.tar.gz": "e39635d2cb60bba7aea80801fc6524806cb6980b68bf8c9b74389c93db445f63",
  "https://nodejs.org/dist/v19.5.0/node-v19.5.0-darwin-arm64.tar.gz": "6b2ee18d9e888840411086151ab7f2fe519ff9b9292ed450aa98838b7eb58009",
  "https://nodejs.org/dist/v19.5.0/node-v19.5.0-darwin-x64.tar.gz": "ebb3798171ce65fb11420aa21696ef6aadc9a1969998d6e00bbea46961c07045",
  "https://nodejs.org/dist/v19.5.0/node-v19.5.0-linux-x64.tar.gz": "0df264934dadd15e7e9ba7576e88129017e62b29f259325c3fd3f1688fdf85bb",
  "https://nodejs.org/dist/v19.6.0/node-v19.6.0-darwin-arm64.tar.gz": "a759366eea06f3433f1f1f7778b6e22d68bbf75661a2de1cd03fc85e30f649cf",
  "https://nodejs.org/dist/v19.6.0/node-v19.6.0-darwin-x64.tar.gz": "6b97f9e434a3a3b4cfef35ae1881ced9e80adc3fb536b3060d2ceda5c446a6d3",
  "https://nodejs.org/dist/v19.6.0/node-v19.6.0-linux-x64.tar.gz": "142e3caf0ea8476767d4ad006acf46b9dd059c169d3287f9d58eac964f16a4e1",
  "https://nodejs.org/dist/v19.7.0/node-v19.7.0-darwin-arm64.tar.gz": "7a96935baf731d0917a96370dda707b8195ae0a123d6c5ff777d41c3fdda949d",
  "https://nodejs.org/dist/v19.7.0/node-v19.7.0-darwin-x64.tar.gz": "2b8593445a4ffc6f42020827dce134497204d55d1ac4a705c0919583d2e6a781",
  "https://nodejs.org/dist/v19.7.0/node-v19.7.0-linux-x64.tar.gz": "f5f0ab097f4d120045a327ed2cf9afff264e10c5d304d6ec9529beedfd0c0fd6",
  "https://nodejs.org/dist/v19.8.0/node-v19.8.0-darwin-arm64.tar.gz": "a4cd2534f84d4c1399ac6bc970492440bb35c91b08023703f09346d02973b148",
  "https://nodejs.org/dist/v19.8.0/node-v19.8.0-darwin-x64.tar.gz": "ebcba3767de967593624be989aaaf143d53ed81aeb5e7d861d1abb6b0bd6db57",
  "https://nodejs.org/dist/v19.8.0/node-v19.8.0-linux-x64.tar.gz": "a7f584b2f28eb18e1130ee590cf0062e4ee967412d1e8d029f3eb46c56598afc",
  "https://nodejs.org/dist/v19.8.1/node-v19.8.1-darwin-arm64.tar.gz": "aafae50af9af911771c766e529eb2522a14bc4695331260e4280be7f526dcaf4",
  "https://nodejs.org/dist/v19.8.1/node-v19.8.1-darwin-x64.tar.gz": "f19cb444924dc0168696445ea7b8ec0b0ccdb5c84c59f289aaa847dc20a9defc",
  "https://nodejs.org/dist/v19.8.1/node-v19.8.1-linux-x64.tar.gz": "77b47ce0ed17ef90c1df6ef1ca6ea0f1375346ae4d5099708d9ee39d805f9d6e",
  "https://nodejs.org/dist/v19.9.0/node-v19.9.0-darwin-arm64.tar.gz": "13f7f0e57a2123e55a3172b65e08bc2a51fb52bf366a83d7dda12456ebdc3da0",
  "https://nodejs.org/dist/v19.9.0/node-v19.9.0-darwin-x64.tar.gz": "4f1a5b72ef0bcb6757e5daaf3fcf2c26fa35dc5d5fdff7692b63775ed51934a4",
  "https://nodejs.org/dist/v19.9.0/node-v19.9.0-linux-x64.tar.gz": "15168a298d150335c098f19449f9baef0b0758466723fafc23ef209156dae604",
  "https://nodejs.org/dist/v20.0.0/node-v20.0.0-darwin-arm64.tar.gz": "ee27eea6694a5d8c834b11a12fb85a5dae01a91178be12920a6da12d8c299c43",
  "https://nodejs.org/dist/v20.0.0/node-v20.0.0-darwin-x64.tar.gz": "a26019f8dc6f0b261b1eebabeedb00f478460c36950a99b5c7e161af005e400e",
  "https://nodejs.org/dist/v20.0.0/node-v20.0.0-linux-x64.tar.gz": "95439a0a836fc858565c7b6a7b1e55d1741901e6f205485e496abbefe973cfce",
  "https://nodejs.org/dist/v20.1.0/node-v20.1.0-darwin-arm64.tar.gz": "fd3bca029883cb84d4f58e7adb1a2c4fc4e616a8297fb08cb5c34465b7c4071a",
  "https://nodejs.org/dist/v20.1.0/node-v20.1.0-darwin-x64.tar.gz": "770dd45c15cfafa3f945fce173aa84dfed94931923242700718edf6883b74fff",
  "https://nodejs.org/dist/v20.1.0/node-v20.1.0-linux-x64.tar.gz": "fbc345638e3fed3b639353b2b3971bddba9e55e93b6e1848be6215787d7f20b8",
  "https://nodejs.org/dist/v20.10.0/node-v20.10.0-darwin-arm64.tar.gz": "68b93099451d77aac116cf8fce179cabcf53fec079508dc6b39d3a086fb461a8",
  "https://nodejs.org/dist/v20.10.0/node-v20.10.0-darwin-x64.tar.gz": "5ff5e8abd3eea6e5f507eb6677554f5b2188eedef654096aa4168a9941e91a32",
  "https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-x64.tar.gz": "d3f0908a9d9190a8525c5b9a716ed91bb57e908555841b0c47f75b2a001ff91b",
  "https://nodejs.org/dist/v20.11.0/node-v20.11.0-darwin-arm64.tar.gz": "94e443d007e2882f8e5aecc85d978f7591520dc3b642adc7583b3cb0b3fc37d7",
  "https://nodejs.org/dist/v20.11.0/node-v20.11.0-darwin-x64.tar.gz": "c0ba02c905814258bd99a362027f8d4d2cc738218a9cf1dce2620e8735e3a80e",
  "https://nodejs.org/dist/v20.11.0/node-v20.11.0-linux-x64.tar.gz": "9556262f6cd4c020af027782afba31ca6d1a37e45ac0b56cecd2d5a4daf720e0",
  "https://nodejs.org/dist/v20.11.1/node-v20.11.1-darwin-arm64.tar.gz": "e0065c61f340e85106a99c4b54746c5cee09d59b08c5712f67f99e92aa44995d",
  "https://nodejs.org/dist/v20.11.1/node-v20.11.1-darwin-x64.tar.gz": "c52e7fb0709dbe63a4cbe08ac8af3479188692937a7bd8e776e0eedfa33bb848",
  "https://nodejs.org/dist/v20.11.1/node-v20.11.1-linux-x64.tar.gz": "bf3a779bef19452da90fb88358ec2c57e0d2f882839b20dc6afc297b6aafc0d7",
  "https://nodejs.org/dist/v20.12.0/node-v20.12.0-darwin-arm64.tar.gz": "422a74b7ede14b697a8c2ca887ea161fe79898a35f163fdfb98435c5ab25027b",
  "https://nodejs.org/dist/v20.12.0/node-v20.12.0-darwin-x64.tar.gz": "5c7d71a1c1cf613037432e0b6c3d913d96604d9293b3397ec70b344730c81daf",
  "https://nodejs.org/dist/v20.12.0/node-v20.12.0-linux-x64.tar.gz": "b6b998947595c9550d6b89c815a68d608f5920275f1b48812f89792de3fdd893",
  "https://nodejs.org/dist/v20.12.1/node-v20.12.1-darwin-arm64.tar.gz": "65df8cb0724e3a58c7757b75a70cc1057e1f67ffc5e852bfe6241de0b37c70a0",
  "https://nodejs.org/dist/v20.12.1/node-v20.12.1-darwin-x64.tar.gz": "f5dc3c71c87c58c9b019d9f85302db3a6a6c47167c5a0480b697f153d02ac316",
  "https://nodejs.org/dist/v20.12.1/node-v20.12.1-linux-x64.tar.gz": "da2f590a39717792dcf8c4bf6b9e4b269601e6ce3a3f150a3c4b379f7eea6d83",
  "https://nodejs.org/dist/v20.12.2/node-v20.12.2-darwin-arm64.tar.gz": "98eb624b52efec2530079e1d11296ec0ac20771b94b087d21649250339cf5332",
  "https://nodejs.org/dist/v20.12.2/node-v20.12.2-darwin-x64.tar.gz": "cd5e9a80a38ccffc036a87b232a5402339c7bf8fa9a494ae0731a1a671687718",
  "https://nodejs.org/dist/v20.12.2/node-v20.12.2-linux-x64.tar.gz": "f8f9b6877778ed2d5f920a5bd853f0f8a8be1c42f6d448c763a95625cbbb4b0d",
  "https://nodejs.org/dist/v20.13.0/node-v20.13.0-darwin-arm64.tar.gz": "ef850bf9045d756c7a703c30fc09d7d9de9c7e7f254c6f4c02a1531381a806fd",
  "https://nodejs.org/dist/v20.13.0/node-v20.13.0-darwin-x64.tar.gz": "417fb4a3a3a70547d5f6d05e068e6d6ec226a6d12c94d91661641e4e11eaeb63",
  "https://nodejs.org/dist/v20.13.0/node-v20.13.0-linux-x64.tar.gz": "a74ceb142362d152aa871710ef9fb338ab72c76415f5afa802fc0aea445397b3",
  "https://nodejs.org/dist/v20.13.1/node-v20.13.1-darwin-arm64.tar.gz": "c30fe595f59dcd2c5158da6bf8bc251ffc85ca37304afa89db150fb3c62c4507",
  "https://nodejs.org/dist/v20.13.1/node-v20.13.1-darwin-x64.tar.gz": "80bde95dc976b84db5ca566738c07305087ae578f5f3b05191e0e6ff54aaeaf2",
  "https://nodejs.org/dist/v20.13.1/node-v20.13.1-linux-x64.tar.gz": "80b978a9fe544b1892e73a4bf89e0b3792b1d459b621874efdc2ddd2270c03fe",
  "https://nodejs.org/dist/v20.14.0/node-v20.14.0-darwin-arm64.tar.gz": "d2148d79e9ff04d2982d00faeae942ceba488ca327a91065e528235167b9e9d6",
  "https://nodejs.org/dist/v20.14.0/node-v20.14.0-darwin-x64.tar.gz": "1dcc18a199cb5f46d43ed1c3c61b87a247d1a1a11dd6b32a36a9c46ac1088f86",
  "https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-x64.tar.gz": "5b9bf40cfc7c21de14a1b4c367650e3c96eb101156bf9368ffc2f947414b6581",
  "https://nodejs.org/dist/v20.15.0/node-v20.15.0-darwin-arm64.tar.gz": "2646c338d2c5ecabba4f745fc315d6fdfbb7e01b5badecc154ad27dda00325fc",
  "https://nodejs.org/dist/v20.15.0/node-v20.15.0-darwin-x64.tar.gz": "95ca98b974d06f84095dd0a977dea5fde79e909d103715fb782856ded12d2146",
  "https://nodejs.org/dist/v20.15.0/node-v20.15.0-linux-x64.tar.gz": "3a873874caae30b5a9125fdf8872f7800cc0216eb89d097470110cd267a596e2",
  "https://nodejs.org/dist/v20.15.1/node-v20.15.1-darwin-arm64.tar.gz": "4743bc042f90ba5d9edf09403207290a9cdd2f6061bdccf7caaa0bbfd49f343e",
  "https://nodejs.org/dist/v20.15.1/node-v20.15.1-darwin-x64.tar.gz": "f5379772ffae1404cfd1fcc8cf0c6c5971306b8fb2090d348019047306de39dc",
  "https://nodejs.org/dist/v20.15.1/node-v20.15.1-linux-x64.tar.gz": "a9db028c0a1c63e3aa0d97de24b0966bc507d8239b3aedc4e752eea6b0580665",
  "https://nodejs.org/dist/v20.16.0/node-v20.16.0-darwin-arm64.tar.gz": "fc7355e778b181575153b7dea4879e8021776eeb376c43c50f65893d2ea70aa3",
  "https://nodejs.org/dist/v20.16.0/node-v20.16.0-darwin-x64.tar.gz": "e18942cd706e4d69a4845ddacee2f1c17a72e853a229e3d2623d2edeb7efde72",
  "https://nodejs.org/dist/v20.16.0/node-v20.16.0-linux-x64.tar.gz": "b3f874ea84e440d69ed02ca92429d0eccd17737fde86db69c1c153d16ec654f2",
  "https://nodejs.org/dist/v20.2.0/node-v20.2.0-darwin-arm64.tar.gz": "8dd23fb204b2c239239085761ccae232c5cdc129f633489598a8759248e5f063",
  "https://nodejs.org/dist/v20.2.0/node-v20.2.0-darwin-x64.tar.gz": "d92bc1e96b2458595f41f5e75749ad4d2b1dd8e96b5ebc34cf5a45ab21797cb3",
  "https://nodejs.org/dist/v20.2.0/node-v20.2.0-linux-x64.tar.gz": "cb0eff87d37f0df1dcd176a58b9ed0be3b5c08a02fe133a5dffd11dcae29626b",
  "https://nodejs.org/dist/v20.3.0/node-v20.3.0-darwin-arm64.tar.gz": "25d5db6192ebcb7013f4138c71a7c423d0da33f28149d28b3b6df7c00527dd40",
  "https://nodejs.org/dist/v20.3.0/node-v20.3.0-darwin-x64.tar.gz": "24293d0217f009cbf821e5f399dcf72c1df2cb27f70cb1f05fd07af2ee6ad2c2",
  "https://nodejs.org/dist/v20.3.0/node-v20.3.0-linux-x64.tar.gz": "80238ee1a9dee6b0d5d1081503c6fdd1c7f81bdf4ca6abd90aa5a568712a2eaa",
  "https://nodejs.org/dist/v20.3.1/node-v20.3.1-darwin-arm64.tar.gz": "fabf0d5bde4e1c16b6b96c310115425508c3750cd2b1d2992fa03d52b0050cf1",
  "https://nodejs.org/dist/v20.3.1/node-v20.3.1-darwin-x64.tar.gz": "fd2be29c8e17ef1460a3c67b5fd36ead27159367a8958fae8fe8f3945465e0db",
  "https://nodejs.org/dist/v20.3.1/node-v20.3.1-linux-x64.tar.gz": "100507c0c4b4cf2f0661ab8ca79b21790c20a4aae24859e9ab60b7d95fbfd740",
  "https://nodejs.org/dist/v20.4.0/node-v20.4.0-darwin-arm64.tar.gz": "34f51397b6aad957b1a8eb70d13da5baf357ead124c1e429a7e939aa61266c06",
  "https://nodejs.org/dist/v20.4.0/node-v20.4.0-darwin-x64.tar.gz": "fe765474a8651b85cee04a64e8473089196b922a36621f464a985a5f4891a054",
  "https://nodejs.org/dist/v20.4.0/node-v20.4.0-linux-x64.tar.gz": "2a9b03dd17fa6d9241b93e244d7e8f2524c4019fb5cfe3a99e59da1ee983cb9a",
  "https://nodejs.org/dist/v20.5.0/node-v20.5.0-darwin-arm64.tar.gz": "56d29a7c620415164e6226804cc1eb8eb7b05ea3123b60c86393fabb551bd5ea",
  "https://nodejs.org/dist/v20.5.0/node-v20.5.0-darwin-x64.tar.gz": "3da7e64ac76309cbbb25524bae75cd335fed2795fcbd4f55e3162bcbcec18176",
  "https://nodejs.org/dist/v20.5.0/node-v20.5.0-linux-x64.tar.gz": "6799042a2970dcecdb71a91d392c53d954ec06d36155c7d11bf7c9a4983b60ea",
  "https://nodejs.org/dist/v20.5.1/node-v20.5.1-darwin-arm64.tar.gz": "9cc794517788aee103dfcffa04d0b90ac33854b0d10eb11a26ba4be38403f731",
  "https://nodejs.org/dist/v20.5.1/node-v20.5.1-darwin-x64.tar.gz": "7a451dd07551a14ce64afdcc5bf8a71df12558edc19a2a9446e37cefe1e572fb",
  "https://nodejs.org/dist/v20.5.1/node-v20.5.1-linux-x64.tar.gz": "a8678ae00425acdf692e943e3f1cea11a4c46281e4257b82886423bd4ef6f2b5",
  "https://nodejs.org/dist/v20.6.0/node-v20.6.0-darwin-arm64.tar.gz": "1ed71ea4ef5985f11b65c3961875ad91223c201f2042c00568a82fe7020a5cea",
  "https://nodejs.org/dist/v20.6.0/node-v20.6.0-darwin-x64.tar.gz": "16657f07cbe8c3d5589d70104ef51955c04abf249ea83b1109f924444ed828aa",
  "https://nodejs.org/dist/v20.6.0/node-v20.6.0-linux-x64.tar.gz": "fc14b089783e7fcaefd01bb7afc0561fac55e1950d56a6b33891a93cb8007b17",
  "https://nodejs.org/dist/v20.6.1/node-v20.6.1-darwin-arm64.tar.gz": "d8ba8018d45b294429b1a7646ccbeaeb2af3cdf45b5c91dabbd93e2a2035cb46",
  "https://nodejs.org/dist/v20.6.1/node-v20.6.1-darwin-x64.tar.gz": "365ec544c6596f194afff9a613554abfc68d4a2274181b7651386d9a11cf5862",
  "https://nodejs.org/dist/v20.6.1/node-v20.6.1-linux-x64.tar.gz": "26dd13a6f7253f0ab9bcab561353985a297d927840771d905566735b792868da",
  "https://nodejs.org/dist/v20.7.0/node-v20.7.0-darwin-arm64.tar.gz": "08aa09792f30a86e8904e334ba6d348ad73e926b5e441ed9abcdcbea651dc926",
  "https://nodejs.org/dist/v20.7.0/node-v20.7.0-darwin-x64.tar.gz": "ceeba829f44e7573949f2ce2ad5def27f1d6daa55f2860bea82964851fae01bc",
  "https://nodejs.org/dist/v20.7.0/node-v20.7.0-linux-x64.tar.gz": "034bbec28da7b729aea531000a56b37076e94e44aa5dfa346a1d1a89025915a8",
  "https://nodejs.org/dist/v20.8.0/node-v20.8.0-darwin-arm64.tar.gz": "cbcb7fdbcd9341662256df5e4488a0045242f87382879242093e0f0699511abc",
  "https://nodejs.org/dist/v20.8.0/node-v20.8.0-darwin-x64.tar.gz": "a6f6b573ea656c149956f69f35e04ebb242b945d59972bea2e96a944bbf50ad1",
  "https://nodejs.org/dist/v20.8.0/node-v20.8.0-linux-x64.tar.gz": "ae6f288a21a3bc7a82b79d3f00c52216df6de09c45eac0ea754243a9c7fb5e69",
  "https://nodejs.org/dist/v20.8.1/node-v20.8.1-darwin-arm64.tar.gz": "5451f3651c89cd8f224e74961c84e68f4c8d63fe288431a3223b0465cc8b961e",
  "https://nodejs.org/dist/v20.8.1/node-v20.8.1-darwin-x64.tar.gz": "92b00b357c311eb45dd86516b032d80c63894aa069821c3ae3c8b3bbd00fdb9a",
  "https://nodejs.org/dist/v20.8.1/node-v20.8.1-linux-x64.tar.gz": "a42ac1f81704b14c7d07ddde989a8e290087b0487ee3f47185eb0240ba518195",
  "https://nodejs.org/dist/v20.9.0/node-v20.9.0-darwin-arm64.tar.gz": "31d2d46ae8d8a3982f54e2ff1e60c2e4a8e80bf78a3e8b46dcaac95ac5d7ce6a",
  "https://nodejs.org/dist/v20.9.0/node-v20.9.0-darwin-x64.tar.gz": "fc5b73f2a78c17bbe926cdb1447d652f9f094c79582f1be6471b4b38a2e1ccc8",
  "https://nodejs.org/dist/v20.9.0/node-v20.9.0-linux-x64.tar.gz": "f0919f092fbf74544438907fa083c21e76b2d7a4bc287f0607ada1553ef16f60",
  "https://nodejs.org/dist/v21.0.0/node-v21.0.0-darwin-arm64.tar.gz": "d49aae353ab9e264a1d8c75f80eb26dcc4006f50b35ba05bda3a9c33f5554609",
  "https://nodejs.org/dist/v21.0.0/node-v21.0.0-darwin-x64.tar.gz": "2ec98307e388407cfa62d1fb8abc4d6dc1e54c11bc70329d6675ed0595326763",
  "https://nodejs.org/dist/v21.0.0/node-v21.0.0-linux-x64.tar.gz": "013f370f1772197cb4e22f22f2185ee26d2e5f3acdb2f252d11cd214e9a8cdb9",
  "https://nodejs.org/dist/v21.1.0/node-v21.1.0-darwin-arm64.tar.gz": "4872463830381785b91d13a7fbb9b6f4a9c7658e10d964f6c421951cec8833ad",
  "https://nodejs.org/dist/v21.1.0/node-v21.1.0-darwin-x64.tar.gz": "6b526c08320fcf41ced0ceee7588828ea2cb07ba826af4ff82b0ec53958fd8a4",
  "https://nodejs.org/dist/v21.1.0/node-v21.1.0-linux-x64.tar.gz": "b919cad4e8a5abbd7e6a4433c4f8a7cdc1a78c1e526c6c1aa4a5fcf74011ad2b",
  "https://nodejs.org/dist/v21.2.0/node-v21.2.0-darwin-arm64.tar.gz": "e085e9e695a5fc715c24d0d2ee73a2cebfc2a2b456a28b58f31077609591f4a0",
  "https://nodejs.org/dist/v21.2.0/node-v21.2.0-darwin-x64.tar.gz": "ff6483bdf4f9817d9915f5fdf1b9154c7689f47ef310eac5ab3c40f6a6e4b700",
  "https://nodejs.org/dist/v21.2.0/node-v21.2.0-linux-x64.tar.gz": "2600d1103d9963ca194aa52b5610ea28f1e4c2df81e525799fba9b7b530c6e54",
  "https://nodejs.org/dist/v21.3.0/node-v21.3.0-darwin-arm64.tar.gz": "0dcb82d52dffacd0e0072c01cd919806432dd40be5d7ae37cc1fb2df9cd85c75",
  "https://nodejs.org/dist/v21.3.0/node-v21.3.0-darwin-x64.tar.gz": "abe6226f030e4affb37c964628abac19356153223f97c7b663754197ba89c3ce",
  "https://nodejs.org/dist/v21.3.0/node-v21.3.0-linux-x64.tar.gz": "e8f8af0a4a5b07ff9ced55efc1b6ea712a1441b95c02ce0d8814070148f27f42",
  "https://nodejs.org/dist/v21.4.0/node-v21.4.0-darwin-arm64.tar.gz": "459a23a6044003c6cb5d24867da0c473bd8c2e4cb5689517051be182eed46c2b",
  "https://nodejs.org/dist/v21.4.0/node-v21.4.0-darwin-x64.tar.gz": "438cf09d2b48116170f1b2bf351f19a77e62c85b939524d4cf3c0a5b7bd0dba9",
  "https://nodejs.org/dist/v21.4.0/node-v21.4.0-linux-x64.tar.gz": "d8cd0ec0b78bcbc591e7a4655a92c1c667e64bc434e7a895904dc1fe9442af1d",
  "https://nodejs.org/dist/v21.5.0/node-v21.5.0-darwin-arm64.tar.gz": "66af9055dcceacc2fcd01ccbb47a565a1dd8f4314300a0f37f13771059490a09",
  "https://nodejs.org/dist/v21.5.0/node-v21.5.0-darwin-x64.tar.gz": "de858cb5257f101dc0681cd65493b589a35ac61f69f46b62cbc1cdaf7cb51a1b",
  "https://nodejs.org/dist/v21.5.0/node-v21.5.0-linux-x64.tar.gz": "6e61f81fe1759892fb1f84f62fe470c8d4d6dfc07969af5700f06b4672a9e8d3",
  "https://nodejs.org/dist/v21.6.0/node-v21.6.0-darwin-arm64.tar.gz": "425d80f28edf6ec2e4d53388d839cf45e0ec771e6276028559d433348ca75f7b",
  "https://nodejs.org/dist/v21.6.0/node-v21.6.0-darwin-x64.tar.gz": "a2310fbfe0109d764ed8024f17c6fcdba5ef9327fb810c03bca9011eccae777b",
  "https://nodejs.org/dist/v21.6.0/node-v21.6.0-linux-x64.tar.gz": "d12a6fc04091aa246402b4cac67215cd2578f178300a361cfa9e28b2ca16d679",
  "https://nodejs.org/dist/v21.6.1/node-v21.6.1-darwin-arm64.tar.gz": "94c280bba809fa66867e363ec9e990217aedf893116660b8c75a1c4fda3baea5",
  "https://nodejs.org/dist/v21.6.1/node-v21.6.1-darwin-x64.tar.gz": "5c4821c62a1f61cf3219bc244d30a5b1cdec197c8acabc1ee7cd9ff17bbba947",
  "https://nodejs.org/dist/v21.6.1/node-v21.6.1-linux-x64.tar.gz": "d2ac105754e5fc657a6a25ea7d31f19dd63d3ec845dce0aef0232533d52bc125",
  "https://nodejs.org/dist/v21.6.2/node-v21.6.2-darwin-arm64.tar.gz": "120c8205654c640865864dc464389b3ffe6d7ebe310dffdbe3fd8718a512e14f",
  "https://nodejs.org/dist/v21.6.2/node-v21.6.2-darwin-x64.tar.gz": "0f75d9b46b986100c6faeec040ee46adf4981eb6abb5dd63e7a6ca4868d280f4",
  "https://nodejs.org/dist/v21.6.2/node-v21.6.2-linux-x64.tar.gz": "d4504dcbcd1a9ded42d86bc20a7e72d6d631e49dcf3f9c849c3b51b12f3f4544",
  "https://nodejs.org/dist/v21.7.0/node-v21.7.0-darwin-arm64.tar.gz": "f48ad51cf3c2814bbf61c8c26efd810e5e22dcac980786fd7ac5b54365233d2c",
  "https://nodejs.org/dist/v21.7.0/node-v21.7.0-darwin-x64.tar.gz": "3f81adca80b523b413e26f03f855f4a2ae52d9af20f0cda2e259dd26a0608607",
  "https://nodejs.org/dist/v21.7.0/node-v21.7.0-linux-x64.tar.gz": "0fce039e2b6af00766492127a49f959ae92ed22fede4c49e9a8c2543aadbd6e2",
  "https://nodejs.org/dist/v21.7.1/node-v21.7.1-darwin-arm64.tar.gz": "0a4dde483479dcf272f3d4d7afb509c3d45cf7a1ea451ce108f434dad4fa43e4",
  "https://nodejs.org/dist/v21.7.1/node-v21.7.1-darwin-x64.tar.gz": "a406f4fbe68ff33319d513fa645aa7b9508c2cb65299f0a2de1757c2a6333c85",
  "https://nodejs.org/dist/v21.7.1/node-v21.7.1-linux-x64.tar.gz": "c7b15146aed968b781c235b6a8f67608be559c4615de9526a9851ae28660cc09",
  "https://nodejs.org/dist/v21.7.2/node-v21.7.2-darwin-arm64.tar.gz": "d00a2b5002db121d798f1c9556342abb6ec6a4fac9d6197bc86c922a796812ae",
  "https://nodejs.org/dist/v21.7.2/node-v21.7.2-darwin-x64.tar.gz": "6211829236013582fb654b4b9f8c6528dcb07620f6f82878ef514fae1b30685e",
  "https://nodejs.org/dist/v21.7.2/node-v21.7.2-linux-x64.tar.gz": "06b891c82c9b19b8d8553222de5de8afd43a38c1b898f9ca323e1d2e22da9075",
  "https://nodejs.org/dist/v21.7.3/node-v21.7.3-darwin-arm64.tar.gz": "165d3ba3500cfc8708f85d3815aaaa21ce418164c933d5419c30825ccad3a99c",
  "https://nodejs.org/dist/v21.7.3/node-v21.7.3-darwin-x64.tar.gz": "58d0212e169764c3424d2d5bec73e8a098d34b4e82fca6e1dd54083ea3049c5f",
  "https://nodejs.org/dist/v21.7.3/node-v21.7.3-linux-x64.tar.gz": "a64cbb12282cb60d35743ef4f51561f8d89946a5f0a484f99168f4de602d7c3d",
  "https://nodejs.org/dist/v22.0.0/node-v22.0.0-darwin-arm64.tar.gz": "ea96d349cfaa67aa87ceeaa3e5b52c9167f7ac302fd8d1ff162d0785e9dc0785",
  "https://nodejs.org/dist/v22.0.0/node-v22.0.0-darwin-x64.tar.gz": "422a3887ff5418f0a4552d89cf99346ab8ab51bb5d384660baa88b8444d2c111",
  "https://nodejs.org/dist/v22.0.0/node-v22.0.0-linux-x64.tar.gz": "74bb0f3a80307c529421c3ed84517b8f543867709f41e53cd73df99e6442af4d",
  "https://nodejs.org/dist/v22.1.0/node-v22.1.0-darwin-arm64.tar.gz": "93904abf2b6afd0dc2a7c2947a83e10ed65cc39171db17663edb6f763aaa5a57",
  "https://nodejs.org/dist/v22.1.0/node-v22.1.0-darwin-x64.tar.gz": "3a2c351b3eeeb4d12dee978f93f8f510589384b66a09feb903b609a58cf1bb5b",
  "https://nodejs.org/dist/v22.1.0/node-v22.1.0-linux-x64.tar.gz": "d8ae35a9e2bb0c0c0611ee9bacf564ea51cc8291ace1447f95ee6aeaf4f1d61d",
  "https://nodejs.org/dist/v22.2.0/node-v22.2.0-darwin-arm64.tar.gz": "66dd98bd28d19603f2e5ab0aa0e07b64f8cad28bbc446bb44fb61cc3da62e685",
  "https://nodejs.org/dist/v22.2.0/node-v22.2.0-darwin-x64.tar.gz": "b3cd4ab4bb4ac7f9bd5c7603baf6bbdcf466c86bb6ca49abf5e221ab8fad7ceb",
  "https://nodejs.org/dist/v22.2.0/node-v22.2.0-linux-x64.tar.gz": "2c6eaf8bfd0f886ed8764ffce19c795e909639105e4056b1d9f8f917bad12cf1",
  "https://nodejs.org/dist/v22.3.0/node-v22.3.0-darwin-arm64.tar.gz": "b6723f1e4972af1ca8a7ef9ec63305ee8cd4380fce3071e0e1630dfe055d77e3",
  "https://nodejs.org/dist/v22.3.0/node-v22.3.0-darwin-x64.tar.gz": "7fe139f9d769d65c27212f8be8f858e1ee522edf3a66eed1d08d42ba102995f8",
  "https://nodejs.org/dist/v22.3.0/node-v22.3.0-linux-x64.tar.gz": "a6d4fbf4306a883b8e1d235a8a890be84b9d95d2d39b929520bed64da41ce540",
  "https://nodejs.org/dist/v22.4.0/node-v22.4.0-darwin-arm64.tar.gz": "3cac2e50c2bac76700d1bf124cb8836299f82550f9032b94a84e53cfc687c2b4",
  "https://nodejs.org/dist/v22.4.0/node-v22.4.0-darwin-x64.tar.gz": "d0b978af9b20b7d083ebd00932dee29a57466bd030cd605f6fe6cf00ff9df357",
  "https://nodejs.org/dist/v22.4.0/node-v22.4.0-linux-x64.tar.gz": "407531c82d4ccffa4231b82086f614f2de2e4008146aff124f7d76ebb87ea45a",
  "https://nodejs.org/dist/v22.4.1/node-v22.4.1-darwin-arm64.tar.gz": "6e0b15d15a80878a57fc938588f64b1d6b59314ef47a0d439e17cb5e68b82a82",
  "https://nodejs.org/dist/v22.4.1/node-v22.4.1-darwin-x64.tar.gz": "64aae9256cdffddbf535a7f6d30c5d2d4a8e01eafb035ab743203e402c68663b",
  "https://nodejs.org/dist/v22.4.1/node-v22.4.1-linux-x64.tar.gz": "addb41bd7d5bdef51dc3bd76292889692664b3c9de1b7c5f89aba95e474aee84",
  "https://nodejs.org/dist/v22.5.0/node-v22.5.0-darwin-arm64.tar.gz": "dd484dc9b461aa78cfea3f48d540b4ae600efb07c7482893ee9d260dd3686614",
  "https://nodejs.org/dist/v22.5.0/node-v22.5.0-darwin-x64.tar.gz": "a4409511fd1008a75f16b42a2d5694f3622f361eafa59bec5bab1928389754a2",
  "https://nodejs.org/dist/v22.5.0/node-v22.5.0-linux-x64.tar.gz": "f1a2eadec1f7ae92a98252eda0579b581d9a592792a1a3c391a073b38d5f036c",
  "https://nodejs.org/dist/v22.5.1/node-v22.5.1-darwin-arm64.tar.gz": "7602384855f1e169b60e51c360e5a2c672b89a19ccda0199ce4675d68fefaaf2",
  "https://nodejs.org/dist/v22.5.1/node-v22.5.1-darwin-x64.tar.gz": "6acb4533bc0a43a468f90bbd49230aa16c7c57b2a3451efe02175feea346754d",
  "https://nodejs.org/dist/v22.5.1/node-v22.5.1-linux-x64.tar.gz": "2a7b8b8aa5c739ae55233d59f78736911a8a5da5ea1c63f0e843da270d039499",
  "https://nodejs.org/dist/v22.6.0/node-v22.6.0-darwin-arm64.tar.gz": "9ea60766807cd3c3a3ad6ad419f98918d634a60fe8dea5b9c07507ed0f176d4c",
  "https://nodejs.org/dist/v22.6.0/node-v22.6.0-darwin-x64.tar.gz": "8766c5968ca22d20fc6237c54c7c5d12ef12e15940d6119a79144ccb163ea737",
  "https://nodejs.org/dist/v22.6.0/node-v22.6.0-linux-x64.tar.gz": "f2f4ccbcbc0a443e5fadebd1149a22f96087ec09cef52ff343a15ee835206d96",
  "https://nodejs.org/dist/v20.17.0/node-v20.17.0-linux-x64.tar.gz": "21e656f6f4e34080ddc5d75fbfe58ce8482fe6e70a76aeae14afdcdc1e23079d",
  "https://nodejs.org/dist/v20.17.0/node-v20.17.0-darwin-x64.tar.gz": "eefe9447dbb0b5b233d42730989c6c364487de4043145db2f63da94e9623c380",
  "https://nodejs.org/dist/v20.17.0/node-v20.17.0-darwin-arm64.tar.gz": "476324108c4361935465631eec47df1c943ba2c87bc050853385b1d1c71f0b1f",
  "https://nodejs.org/dist/v22.7.0/node-v22.7.0-darwin-x64.tar.gz": "d8d0c2835bad13427cc5a8e1a9aed536f6dd25f3bb55b1f56b027a18d5aa964f",
  "https://nodejs.org/dist/v22.7.0/node-v22.7.0-linux-x64.tar.gz": "e5be0590039a0aaf699d6b4f31c780b2a467f7f37e71c20c95364933715daa05",
  "https://nodejs.org/dist/v22.7.0/node-v22.7.0-darwin-arm64.tar.gz": "5c54b08ec6cab6ef1e4e3302e655794f791132e9148dfc7741c5cba4bba1f27b",
  "https://nodejs.org/dist/v22.8.0/node-v22.8.0-darwin-arm64.tar.gz": "723d53380d500087d738ee1a255fea121060602140a8e93cf7bd3013cd7531a4",
  "https://nodejs.org/dist/v22.8.0/node-v22.8.0-darwin-x64.tar.gz": "2f56ac0a9b7f03aea854b8bf2246741179c0b758a0b1b7239d1d5b242aca0f1b",
  "https://nodejs.org/dist/v22.8.0/node-v22.8.0-linux-x64.tar.gz": "a0bc969f61b96575a4b2cdd239729aa3e721384fa9ca3fb926a9582c019c1bbc",
  "https://nodejs.org/dist/v22.9.0/node-v22.9.0-darwin-x64.tar.gz": "2d68692990a38078e1895763ff68f8ef0105299134e7f5654ddafaac69d4fa59",
  "https://nodejs.org/dist/v22.9.0/node-v22.9.0-darwin-arm64.tar.gz": "7d62217f64491524db6bcfb059049d64fd6a9adcae52565ed54aaad365a55afd",
  "https://nodejs.org/dist/v22.9.0/node-v22.9.0-linux-x64.tar.gz": "1efa7ba49fbb80b2110ebed50224705ca23b1edbdd1e3210e293faa006540488",
  "https://nodejs.org/dist/v20.18.0/node-v20.18.0-darwin-arm64.tar.gz": "92e180624259d082562592bb12548037c6a417069be29e452ec5d158d657b4be",
  "https://nodejs.org/dist/v20.18.0/node-v20.18.0-darwin-x64.tar.gz": "c02aa7560612a4e2cc359fd89fae7aedde370c06db621f2040a4a9f830a125dc",
  "https://nodejs.org/dist/v20.18.0/node-v20.18.0-linux-x64.tar.gz": "24a5d58a1d4c2903478f4b7c3cfd2eeb5cea2cae3baee11a4dc6a1fed25fec6c",
  "https://nodejs.org/dist/v22.10.0/node-v22.10.0-darwin-x64.tar.gz": "f8d4a064d3edd49900187e301424a7d7d30f75b60f618811d2aad80b665b42d5",
  "https://nodejs.org/dist/v22.10.0/node-v22.10.0-linux-x64.tar.gz": "674fef1891cc9927b5dc2b0ee2399b77f6621e6b3157f563a9e9491ad3db107b",
  "https://nodejs.org/dist/v22.10.0/node-v22.10.0-darwin-arm64.tar.gz": "75e5b78d59187ca936e67f0b88a6db913f4ab8bb83a27a1d0a34f98089cb4f77",
}
