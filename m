Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40220 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgCZQrr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 12:47:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id u10so8656278wro.7
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 09:47:44 -0700 (PDT)
Date: Thu, 26 Mar 2020 17:47:32 +0100
From: Petr Malat <oss@malat.biz>
Subject: Re: [PATCH v3 3/8] lib: add zstd support to decompress
Message-ID: <20200326164732.GA17157@ntb.petris.klfree.czf>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325195849.407900-4-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <nickrterrell@gmail.com>
Cc: Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>

Hi!
On Wed, Mar 25, 2020 at 12:58:44PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> * Add unzstd() and the zstd decompress interface.
Here I do not understand why you limit the window size to 8MB even when
you read a larger value from the header. I do not see a reason why there
should be such a limitation at the first place and if there should be,
why it differs from ZSTD_WINDOWLOG_MAX.

I removed that limitation to be able to test it in my environment and I
found the performance is worst than with my patch by roughly 20% (on
i7-3520M), which is a major drawback considering the main motivation
to use zstd is the decompression speed. I will test on arm as well and
share the result tomorrow.
  Petr
