Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:54390 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751329AbbINORj convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Sep 2015 10:17:39 -0400
Message-ID: <1442240252.2298.35.camel@decadent.org.uk>
Subject: Re: [PATCH v5] deb-pkg: add source package
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 14 Sep 2015 15:17:32 +0100
In-Reply-To: <000f01d0eef6$76b715a0$642540e0$@net>
References: <000701d0ee9a$ae397600$0aac6200$@net>
	 <CAAqcGHnxA4k__hmhEny=R1fT6yt5aBwVbk=1F6meuwiFYqcr7w@mail.gmail.com>
	 <000f01d0eef6$76b715a0$642540e0$@net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Smythies <dsmythies@telus.net>
Cc: 'Riku Voipio' <riku.voipio@linaro.org>, 'Michal Marek' <mmarek@suse.com>, 'maximilian attems' <maks@stro.at>, 'linux-kbuild' <linux-kbuild@vger.kernel.org>, 'Chris J Arges' <chris.j.arges@canonical.com>

On Mon, 2015-09-14 at 07:05 -0700, Doug Smythies wrote:
> On 2015.09.13 23:33 Riku Voipio wrote:
> > On 14 September 2015 at 06:08, Doug Smythies <dsmythies@telus.net> wrote:
> >> However, I do not understand why I now get a .change
> >> file that I do not want.
> 
> > Is there some problem the presence of this file causes, or is just
> > aesthetic issue?
> 
> I don't want to waste the extra kernel compile time
> for this step, particularly when doing a bisection.

It *shouldn't* take long, but apparently it is because we're wrongly
including multiple builds in the .changes file.

[...]
> Checksums-Sha1:
>  08bf501667de853765641be9d5ab33e61621cc46 967508 linux-firmware-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
>  8c4621d4fb354bda17acd66e8becedd996745b9a 6855204 linux-headers-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
>  2a36875a9576e11e2e295bf75bb1049e27de2b7c 789714 linux-libc-dev_4.0.0-v40-force-1_amd64.deb
>  18fbde8808ba66483036ffa8c5a4f8db1dd67ff6 44133760 linux-image-4.0.0-v40-force_4.0.0-v40-force-1_amd64.deb
>  1ef5d864ade96745db41554e3f8ebe8c1a99564d 967628 linux-firmware-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
>  8d2f578e9ee867cd8a3c10183558f5398cfd551b 6938980 linux-headers-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
>  5e9fccf95ab662fd1fa0dbf27fb64c0d4c9b3607 798728 linux-libc-dev_4.1.0-rc4-2_amd64.deb
>  661772f12127051deb6412096d7bba53fc9eb8ae 44237546 linux-image-4.1.0-rc4_4.1.0-rc4-2_amd64.deb
>  2a0739993973a6adbae88b4404f2368f9489d615 966500 linux-firmware-image-4.0.0_4.0.0-3_amd64.deb
>  3d3ec6e014c1b064941205887079561afe7cbc2e 6856826 linux-headers-4.0.0_4.0.0-3_amd64.deb
>  e98604173c0caad56597d2fe2f156e61d4fc44de 789840 linux-libc-dev_4.0.0-3_amd64.deb
>  67a5ec77c10eb9dc98c9c42362eccad4370a7433 44040296 linux-image-4.0.0_4.0.0-3_amd64.deb
>  9d07dc5a1fd0ced5975d1359ba91de4f54e7c18f 968554 linux-firmware-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
>  0e645a15ddde5c97532e61d18c42258c489275ef 6942192 linux-headers-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
>  334986f94a0d47330f40461826f43ea60f38b6c7 798876 linux-libc-dev_4.1.0-rc5-force-4_amd64.deb
>  a41a3d6319e1ddf60943f481e43ef06aa08df649 44424044 linux-image-4.1.0-rc5-force_4.1.0-rc5-force-4_amd64.deb
>  4df0e4dc13bc6529bb6ea8fabfde91d6e882a4ed 966794 linux-firmware-image-4.1.0-rc5-debug_4.1.0-rc5-debug-5_amd64.deb
> 
> ... very many similar lines, for other kernels, deleted ...
[...]

It looks like we need to delete debian/files at the beginning of the
package build process.  For a normal Debian package build this wouldn't
be needed because we could expect the 'clean' rule to be run between
building different package versions, and that would do it.

Ben.

