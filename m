Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cmta7.telus.net ([209.171.16.80]:34278 "EHLO cmta7.telus.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754790AbbINOFy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 10:05:54 -0400
From: "Doug Smythies" <dsmythies@telus.net>
References: <000701d0ee9a$ae397600$0aac6200$@net> <CAAqcGHnxA4k__hmhEny=R1fT6yt5aBwVbk=1F6meuwiFYqcr7w@mail.gmail.com>
In-Reply-To: <CAAqcGHnxA4k__hmhEny=R1fT6yt5aBwVbk=1F6meuwiFYqcr7w@mail.gmail.com>
Subject: RE: [PATCH v5] deb-pkg: add source package
Date: Mon, 14 Sep 2015 07:05:49 -0700
Message-ID: <000f01d0eef6$76b715a0$642540e0$@net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 8BIT
Content-Language: en-ca
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Riku Voipio' <riku.voipio@linaro.org>
Cc: 'Michal Marek' <mmarek@suse.com>, 'maximilian attems' <maks@stro.at>, 'Ben Hutchings' <ben@decadent.org.uk>, 'linux-kbuild' <linux-kbuild@vger.kernel.org>, 'Chris J Arges' <chris.j.arges@canonical.com>, Doug Smythies <dsmythies@telus.net>

On 2015.09.13 23:33 Riku Voipio wrote:
> On 14 September 2015 at 06:08, Doug Smythies <dsmythies@telus.net> wrote:
>> However, I do not understand why I now get a .change
>> file that I do not want.

> Is there some problem the presence of this file causes, or is just
> aesthetic issue?

I don't want to waste the extra kernel compile time
for this step, particularly when doing a bisection.

> Some people need this file[1] for binary-only builds
> as well, just just dropping it isn't really good idea.

[1] https://lkml.org/lkml/2015/5/14/261

Thanks for the reference.

>> Nor do I want the 532 lines of "dpkg-genchanges"
>> and ""Use of uninitialized value" warnings at the end
>> of the compile.

> That is something that should be fixed. can you paste the contents of
> your debian/changelog after a bindeb-pkg run?

doug@s15:~/temp-k-git/linux$ cat ../linux-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.changes
Format: 1.8
Date: Sun, 13 Sep 2015 10:56:11 -0700
Source: linux-4.3.0-rc1stock1
Binary: linux-image-4.3.0-rc1stock1 linux-headers-4.3.0-rc1stock1 linux-firmware-image-4.3.0-rc1stock1 linux-libc-dev
Architecture: amd64 all
Version: 4.3.0-rc1stock1-49
Distribution: trusty
Urgency: low
Maintainer: Doug Smythies <dsmythies@telus.net>
Changed-By: Doug Smythies <dsmythies@telus.net>
Description:
 linux-firmware-image-4.3.0-rc1stock1 - Linux kernel firmware, version 4.3.0-rc1stock1
 linux-headers-4.3.0-rc1stock1 - Linux kernel headers for 4.3.0-rc1stock1 on ${kernel:debarch}
 linux-image-4.3.0-rc1stock1 - Linux kernel, version 4.3.0-rc1stock1
 linux-libc-dev - Linux support headers for userspace development
Changes:
 linux-4.3.0-rc1stock1 (4.3.0-rc1stock1-49) trusty; urgency=low
 .
   * Custom built Linux kernel.
Checksums-Sha1:
 08bf501667de853765641be9d5ab33e61621cc46 967508 linux-firmware-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 8c4621d4fb354bda17acd66e8becedd996745b9a 6855204 linux-headers-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 2a36875a9576e11e2e295bf75bb1049e27de2b7c 789714 linux-libc-dev_4.0.0-v40-force-1_amd64.deb
 18fbde8808ba66483036ffa8c5a4f8db1dd67ff6 44133760 linux-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 1ef5d864ade96745db41554e3f8ebe8c1a99564d 967628 linux-firmware-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 8d2f578e9ee867cd8a3c10183558f5398cfd551b 6938980 linux-headers-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 5e9fccf95ab662fd1fa0dbf27fb64c0d4c9b3607 798728 linux-libc-dev_4.1.0-rc4-2_amd64.deb
 661772f12127051deb6412096d7bba53fc9eb8ae 44237546 linux-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 2a0739993973a6adbae88b4404f2368f9489d615 966500 linux-firmware-image-4.0.0_4.0.0-3_amd64.deb
 3d3ec6e014c1b064941205887079561afe7cbc2e 6856826 linux-headers-4.0.0_4.0.0-3_amd64.deb
 e98604173c0caad56597d2fe2f156e61d4fc44de 789840 linux-libc-dev_4.0.0-3_amd64.deb
 67a5ec77c10eb9dc98c9c42362eccad4370a7433 44040296 linux-image-4.0.0_4.0.0-3_amd64.deb
 9d07dc5a1fd0ced5975d1359ba91de4f54e7c18f 968554 linux-firmware-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 0e645a15ddde5c97532e61d18c42258c489275ef 6942192 linux-headers-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 334986f94a0d47330f40461826f43ea60f38b6c7 798876 linux-libc-dev_4.1.0-rc5-force-4_amd64.deb
 a41a3d6319e1ddf60943f481e43ef06aa08df649 44424044 linux-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 4df0e4dc13bc6529bb6ea8fabfde91d6e882a4ed 966794 linux-firmware-image-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb

... very many similar lines, for other kernels, deleted ...
 
 130c6258963fabbd3796d7072b6fd6260288eb1d 967746 linux-firmware-image-4.2.0viresh_4.2.0viresh-46_amd64.deb
 d864d305be94d5d35b70b99f39664e3d54677ff0 7100026 linux-headers-4.2.0viresh_4.2.0viresh-46_amd64.deb
 edff646ba44732203867fe6e072b91baa34ed8b7 805314 linux-libc-dev_4.2.0viresh-46_amd64.deb
 88dfb5d4128f8e1c72dd3af7205c960ba1c5a1ad 43750360 linux-image-4.2.0viresh_4.2.0viresh-46_amd64.deb
 dacfd07c87feca920492fd998573cbf2cf7a9047 967576 linux-firmware-image-4.2.0rafael_4.2.0rafael-47_amd64.deb
 07008af1753268e210b14ff56e1f128e845a8ea0 7100716 linux-headers-4.2.0rafael_4.2.0rafael-47_amd64.deb
 51db3e4e8fd89d80882bb8d92106547a6465e030 805386 linux-libc-dev_4.2.0rafael-47_amd64.deb
 92a64114c8639bef03c28fd25b341f220a369982 43755502 linux-image-4.2.0rafael_4.2.0rafael-47_amd64.deb
 4489383f4da25f51ab0531d94c6083f96682cdae 968004 linux-firmware-image-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 1d9b68344be5a5fc29ec3533bee0630c5b748e23 7167212 linux-headers-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 9cdb6332b627040b94efba52c4a61921009b811c 815088 linux-libc-dev_4.3.0-rc1stock-48_amd64.deb
 d186515b63d6d29c61f77e54e89fabc059d3b1d2 43933150 linux-image-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 8f305aea6b0a05bfe36f84329b1ee3283c2b31f6 967762 linux-firmware-image-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
 52e5772ac2544b42d2df2d1b8b62c2b1e90ecb71 7185558 linux-headers-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
 14103d89e70d67f9b75894b8e9ad00134057fb96 815272 linux-libc-dev_4.3.0-rc1stock1-49_amd64.deb
 51c9eadeb29af0c7ab7939977bc7c2514ce38897 43926394 linux-image-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
Checksums-Sha256:
 27b003a6f564985cf77cc17a0f705bcf9e920a5522ae8eb23825ae2a5713865d 967508 linux-firmware-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 2122325d30abaafc40907a71e6c6cba7086c35b2053ac17e7ea79b55b00bfa21 6855204 linux-headers-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 cb6a2d377b43e8933122a99bcedf7fbf66c785d3378ae90716769340d1f77a2d 789714 linux-libc-dev_4.0.0-v40-force-1_amd64.deb
 ddf137fcdf2da2121b48e19fc3a39ea0dd3a53e9d4638a74c9a6d53d7789f85d 44133760 linux-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 0f9cd2413cba723ce5c35b99c8764b30f05ae6cb908ae277d7a5e4ba54f68ed0 967628 linux-firmware-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 83f2e4e19de9602853293e4a72f3b976de0a82585ebd4a65b1df077f9396e9e6 6938980 linux-headers-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 db465d55a0eba5396b135b34d4f237e362479c81164e91ead3486c6d3eeb64e3 798728 linux-libc-dev_4.1.0-rc4-2_amd64.deb
 d90e92fced62c414509b38dfc296eba43f728d541edf3d5c547ff0934f7f613e 44237546 linux-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 2311e5dd2f841214a9bd1da4d54071d532602559265cb40ed24c930ac37e10d3 966500 linux-firmware-image-4.0.0_4.0.0-3_amd64.deb
 2020974f2d2aa6f632cf93e4153b84d2a820d49a76080d5f3c321d0269aed3ae 6856826 linux-headers-4.0.0_4.0.0-3_amd64.deb
 27daf515c5f594d7351b653c90fe465d72ea5a1b271813cf2b5b655906af03e0 789840 linux-libc-dev_4.0.0-3_amd64.deb
 6d01dad22972443ed00170f1e46d86fc40e7dc2f5b4d3345cc29ea9673dfed7b 44040296 linux-image-4.0.0_4.0.0-3_amd64.deb
 76075bb5dfe9d721269cb94ec597a9c51c46fa3291da394e89cd9f2570c040c5 968554 linux-firmware-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 7c46172d6f83a1995c55b987c84c959ebcf207a242b3ac52acc8d30fea19ff7f 6942192 linux-headers-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 efa4b4da6f30cf0757a8843e9fbf75b1aa82c94ea5569184c2186cba42376720 798876 linux-libc-dev_4.1.0-rc5-force-4_amd64.deb
 757bf2e37c6d59d27b49c264f1090f571048dffe777c70267c9d193ee12253ff 44424044 linux-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 1263ce4913f31eb2f2892c6da84d5234a3475e7c206327badfc25aa2dd596dad 966794 linux-firmware-image-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb
 96f90d67fdd33dc39afd5f159e27cbe22eaec555192ceafc877f91e9570e319d 6942614 linux-headers-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb
 d354928f87c8bdab107fd19d85e786a96820bcc90eae710810d6460043e4218d 798898 linux-libc-dev_4.1.0-rc5-debug-5_amd64.deb
 2e87f1935c5ba1fcdf66c5643aaa3de1c75e7378323bc63bdf20896d47cb9d34 44411750 linux-image-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb

... very many similar lines, for other kernels, deleted ...

 f6382eeb2d199a6f846d9ac917c0e738823e8e29a897fe2763da5c5059b7068b 967746 linux-firmware-image-4.2.0viresh_4.2.0viresh-46_amd64.deb
 9c41bb9626c00dbff3502baa83fd674c7544f835d88ca8af7df08524e881b478 7100026 linux-headers-4.2.0viresh_4.2.0viresh-46_amd64.deb
 11e52a5d117486975534fcfc7b794770d774126b9a636109831c63b9bc45f7d6 805314 linux-libc-dev_4.2.0viresh-46_amd64.deb
 3ec8c701391e1281eb88a390a56447619fea0962776490c728fc246fcc28adc2 43750360 linux-image-4.2.0viresh_4.2.0viresh-46_amd64.deb
 882b6f7959499dcd675f345ff8167504a694e84106e51859758965806fa38e18 967576 linux-firmware-image-4.2.0rafael_4.2.0rafael-47_amd64.deb
 ba31fbb50e17aa2e87cdf1fe9d1bbcc7ecffacb0341cc7dab7aeadca0a3b9971 7100716 linux-headers-4.2.0rafael_4.2.0rafael-47_amd64.deb
 ea0ee34b9a8be37d93986fe115299ed00c9d7df59c8b0aa78c3dc4bdd1e7794f 805386 linux-libc-dev_4.2.0rafael-47_amd64.deb
 998eef8bc1f4b66861c2f520b497f5a2154d99abb819fc176eb2f1272e362513 43755502 linux-image-4.2.0rafael_4.2.0rafael-47_amd64.deb
 a5434391750e50ef010493efa804a5d916938a5484e34814850d376507514e0f 968004 linux-firmware-image-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 59373d17aeb25c261e1518b5a657eaa1649b77ebcbe949229f92bf4d85e38d1c 7167212 linux-headers-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 333a2bcf93552c94cfc696a4104b5fe6786a5c2e193a97a469b4dd46adf4a980 815088 linux-libc-dev_4.3.0-rc1stock-48_amd64.deb
 a90420c4f436ce4a57945017e936951309c9a543ad628ac0142752e61d6b338b 43933150 linux-image-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 47804918efaadcb6b640f677bb04f5d12b12335f559d3042a912ad0802a32baf 967762 linux-firmware-image-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
 5d590ec4a324006721b96405937162c22f116e2febe54f1da469646d781728c3 7185558 linux-headers-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
 341ef7561bb1220727cc23e2767dc3ed96c2092a3ae04ac2a59c0a6130f09b31 815272 linux-libc-dev_4.3.0-rc1stock1-49_amd64.deb
 7f92a8986f950603493b2914f4021b4c1eb7ce998aa487d04cbd5729dd43b399 43926394 linux-image-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
Files:
 2c608e888c5d3d13e5db62501bd21112 967508 kernel optional linux-firmware-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 c5f682cb16aa5f33cd7e229e302b4e3b 6855204 kernel optional linux-headers-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 70c12437f42be4828c59f784c0454e0b 789714 devel optional linux-libc-dev_4.0.0-v40-force-1_amd64.deb
 4c0d42f03d1cd950350ccabffa27784d 44133760 kernel optional linux-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
 1a9acd82dfbb907f936452c3959955b5 967628 kernel optional linux-firmware-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 76b615eb1717d3baba8b871c109586ff 6938980 kernel optional linux-headers-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 01a3228ba6fce0af16fd4938e002fc2b 798728 devel optional linux-libc-dev_4.1.0-rc4-2_amd64.deb
 0d409dade79af82edb2cbdcef93a900f 44237546 kernel optional linux-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
 51c4d519493d141362e4d0be416a0273 966500 kernel optional linux-firmware-image-4.0.0_4.0.0-3_amd64.deb
 5ac612c6412320f68db2ad79f8520e4d 6856826 kernel optional linux-headers-4.0.0_4.0.0-3_amd64.deb
 5257d65e1f5eadac81db60a6a1cebbb1 789840 devel optional linux-libc-dev_4.0.0-3_amd64.deb
 a6bceb6cdabb593371be1a74b4454d1f 44040296 kernel optional linux-image-4.0.0_4.0.0-3_amd64.deb
 b3dac21cb3c2440d94404fb465c3f06a 968554 kernel optional linux-firmware-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 608fe3c5cde034693d6f02eb89d8f14e 6942192 kernel optional linux-headers-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 964005a8c61c4ddfda461ec91b220698 798876 devel optional linux-libc-dev_4.1.0-rc5-force-4_amd64.deb
 3089f1b1553988e097c374a5e351227b 44424044 kernel optional linux-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
 30bbf4be1fa388582d7ee5f353390fc4 966794 kernel optional linux-firmware-image-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb
 c57c31c044158408516d72282ba2fa97 6942614 kernel optional linux-headers-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb
 575a27f9a638574d66ca40e3ad7deed7 798898 devel optional linux-libc-dev_4.1.0-rc5-debug-5_amd64.deb
 a49e59605f89df112930fda34db283ae 44411750 kernel optional linux-image-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb

... very many similar lines, for other kernels, deleted ...

 ba09446992f2e47481dd2cda06fa322d 967746 kernel optional linux-firmware-image-4.2.0viresh_4.2.0viresh-46_amd64.deb
 690c74e000195e9800716e78c80fa1c4 7100026 kernel optional linux-headers-4.2.0viresh_4.2.0viresh-46_amd64.deb
 1e6a9cdc988718be545266e2e60669ce 805314 devel optional linux-libc-dev_4.2.0viresh-46_amd64.deb
 9bdf32899e721cc8ba07e8b3c2500889 43750360 kernel optional linux-image-4.2.0viresh_4.2.0viresh-46_amd64.deb
 9c068cb2a73624e07fc7d28742e15d52 967576 kernel optional linux-firmware-image-4.2.0rafael_4.2.0rafael-47_amd64.deb
 226cac426dc6f927114b2b735dc870f1 7100716 kernel optional linux-headers-4.2.0rafael_4.2.0rafael-47_amd64.deb
 df33372f339e1aafaab8fa781f36a9f9 805386 devel optional linux-libc-dev_4.2.0rafael-47_amd64.deb
 86199e4e7ab1cbb93e07dfffd01949ac 43755502 kernel optional linux-image-4.2.0rafael_4.2.0rafael-47_amd64.deb
 29f8056c1b76221c2a4fccfe3caa4ab5 968004 kernel optional linux-firmware-image-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 6dc795d038e757ccb698854149b792b4 7167212 kernel optional linux-headers-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 e4e0c7274d9d7849e0ba92e146bce7f1 815088 devel optional linux-libc-dev_4.3.0-rc1stock-48_amd64.deb
 bb8ed7e7f6d30cdf0a8977c747f6ef8a 43933150 kernel optional linux-image-4.3.0-rc1stock_4.3.0-rc1stock-48_amd64.deb
 ebb34ccb97122e6e41caa7b1bbb5096e 967762 kernel optional linux-firmware-image-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
 b3c4c70a7070c5e810dba23b95a10b0d 7185558 kernel optional linux-headers-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
 00727119cadb258688418b878456b190 815272 devel optional linux-libc-dev_4.3.0-rc1stock1-49_amd64.deb
 f18cbbd3961d32f77ff3ed3f66b92e2f 43926394 kernel optional linux-image-4.3.0-rc1stock1_4.3.0-rc1stock1-49_amd64.deb
doug@s15:~/temp-k-git/linux$


