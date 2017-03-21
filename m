Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34069 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756175AbdCUIfL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Mar 2017 04:35:11 -0400
Received: by mail-lf0-f43.google.com with SMTP id z15so64437588lfd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Mar 2017 01:34:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <75cdc7$20652e@orsmga004.jf.intel.com>
References: <1489443666-29808-1-git-send-email-joe.konno@linux.intel.com>
 <CAAqcGHntEudc=q4au_ewtaQuZLNs-0Z8OVcy5kzHq7OsqPo7Mg@mail.gmail.com> <75cdc7$20652e@orsmga004.jf.intel.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Tue, 21 Mar 2017 10:34:36 +0200
Message-ID: <CAAqcGHkCo_1z=a4bAW9GwoisVGHhyX=-xjr4BopHHwz-4b=6gQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: package: KDEB_SOURCENAME in .deb names
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Konno <joe.konno@linux.intel.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

On 14 March 2017 at 17:47, Joe Konno <joe.konno@linux.intel.com> wrote:
> I took this approach for the following problem as well (which I did
> not mention in my initial submission, silly me):
>
>   - Build and package the same kernel commit, but with different kernel
>     configurations

Semi-related - you probably want to use bindeb-pkg (or my proposed fastdeb-pkg)
as with deb-pkg target you will generate many huge source tarballs with
identical content.

> If I were building and packaging different kernel commits on the same
> tree, I could live without my patch. The bulleted edge case, and my
> original commit message's case, do something interesting for target
> installations. With some KDEB_PKGVERSION finesse, I could make multiple
> versions of 'linux-configA-image' and 'linux-configB-image' available
> to the target. At least for my usage, this patch can be useful.

> Granted, LOCALVERSION hacking could accomplish the same thing. Maybe
> it's the pedant in me, but "4.11.0-rc2$LOCALVERSION" seems ideal for
> describing a named package, be it 'linux-image', 'linux-configA-image',
> or '$KDEB_SOURCENAME-image'.

It is idiomatic for Debian to have the configuration also in the version string:

$ apt-cache search ^linux-image
linux-image-4.9.0-2-686-pae-unsigned - Linux 4.9 for modern PCs
linux-image-4.9.0-2-686-unsigned - Linux 4.9 for older PCs
linux-image-4.9.0-2-amd64-unsigned - Linux 4.9 for 64-bit PCs
linux-image-4.9.0-2-rt-686-pae-unsigned - Linux 4.9 for modern PCs,
PREEMPT_RT
linux-image-4.9.0-2-rt-amd64-unsigned - Linux 4.9 for 64-bit PCs, PREEMPT_RT

It is a bit of bikeshedding matter, but your users might be expecting the above
command to tell what kernels are available and "dpkg -l linux-image*" to
tell what kernels are installed.

Also I wouldn't be surprised if various scripts (dkms?) expected the
kernel packages to
start with "linux-image-".

Riku
