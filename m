Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:44795 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfFFKlb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jun 2019 06:41:31 -0400
Received: by mail-io1-f67.google.com with SMTP id s7so1380946iob.11
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jun 2019 03:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190604233434.nx5tXmlsH%akpm@linux-foundation.org> <a4bfdf4c-de88-31a2-8f8d-f32c1ebdbd02@infradead.org>
In-Reply-To: <a4bfdf4c-de88-31a2-8f8d-f32c1ebdbd02@infradead.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 6 Jun 2019 12:41:17 +0200
Message-ID: <CAKv+Gu9=b1ewM8p9y8T7zCiQi=qYEA-webkFns-hg5rhu6=26g@mail.gmail.com>
Subject: Re: mmotm 2019-06-04-16-33 uploaded (drivers/crypto/atmel)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, mhocko@suse.cz, mm-commits@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Tudor Ambarus <tudor.ambarus@microchip.com>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Wed, 5 Jun 2019 at 20:56, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 6/4/19 4:34 PM, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2019-06-04-16-33 has been uploaded to
> >
> >    http://www.ozlabs.org/~akpm/mmotm/
> >
> > mmotm-readme.txt says
> >
> > README for mm-of-the-moment:
> >
> > http://www.ozlabs.org/~akpm/mmotm/
> >
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> >
>
> (problem seen in mmotm, but this is not an mmotm patch; it's from linux-next)
>
> on x86_64:
>
> ld: drivers/crypto/atmel-i2c.o: in function `atmel_i2c_checksum':
> atmel-i2c.c:(.text+0x1b): undefined reference to `crc16'
>
> because CONFIG_CRC16=m and CONFIG_CRYPTO_DEV_ATMEL_I2C=y.
> The latter selects the former.
> I don't know how to make CRC16 be builtin in this case. ???
> I changed the 'select' to 'imply' but that didn't make any difference.
>
> Full randconfig file is attached.
>

CONFIG_CRYPTO_DEV_ATMEL_I2C was lacking the 'select' entirely, but it
has now been added (as a fix to the crypto tree)
