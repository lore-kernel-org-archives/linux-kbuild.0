Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40638 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727593AbgCZVoa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 17:44:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id a81so9652587wmf.5
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 14:44:29 -0700 (PDT)
Date: Thu, 26 Mar 2020 22:44:19 +0100
From: Petr Malat <oss@malat.biz>
Subject: Re: [PATCH v3 3/8] lib: add zstd support to decompress
Message-ID: <20200326214419.GA13249@ntb.petris.klfree.czf>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
 <20200326164732.GA17157@ntb.petris.klfree.czf>
 <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
 <20200326201634.GA9948@ntb.petris.klfree.czf>
 <ED5FFEDC-A3B7-470E-95AE-B60EB1E6AE64@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ED5FFEDC-A3B7-470E-95AE-B60EB1E6AE64@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>

On Thu, Mar 26, 2020 at 09:13:54PM +0000, Nick Terrell wrote:
> >> What do you mean by that? Can you share with me the test you ran?
> >> Is this for kernel decompression or initramfs decompression?
> > Initramfs - you can apply my v2 patch on v5.5 and try with your test data.
> > 
> > I have tested your patch also on ARMv7 platform and there the degradation
> > was 8%.
> 
> Are you comparing the performance of an 8 MB window size vs a 128 MB
> window size?
No, I use the same initramfs file with 2 different kernels for the test. I have
removed
  if (params.windowSize > ZSTD_WINDOWSIZE_MAX) goto out;
from your code.
  Petr
