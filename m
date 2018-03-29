Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35826 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbeC2Hg1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Mar 2018 03:36:27 -0400
Received: by mail-lf0-f45.google.com with SMTP id t132-v6so7057740lfe.2
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Mar 2018 00:36:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e46ed72fab5dd0a575e22efa360150ae003db939.camel@decadent.org.uk>
References: <20180221101032.27263-1-riku.voipio@linaro.org>
 <CAK7LNAQ+evMKMMcqQ8KX2aFGthsx=20o2X4EiQ7qu9y50ZvZjw@mail.gmail.com>
 <CAAqcGHkvKssjFmG0ebz5uBeO_PGeov5_C6MutW65ONp5riFwRg@mail.gmail.com>
 <CAAqcGHmeYqe81zG=PvoCtzhKhAU=27LT_K8OVhTykyBZGdML4A@mail.gmail.com>
 <CAK7LNASuGcv0rhX+NZ4q7D_hkq7=HqeZ2j5hOiW=F1VXeenwYA@mail.gmail.com>
 <CAAqcGHn6mHHMGmcBFfRdwNSJwPaOfmnidw_T_hRKS66V47aryg@mail.gmail.com> <e46ed72fab5dd0a575e22efa360150ae003db939.camel@decadent.org.uk>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Thu, 29 Mar 2018 10:36:25 +0300
Message-ID: <CAAqcGHnBZnpexospouTdfOq4NNYg4kDDirKg6+HbYsQrKeUf6Q@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

On 29 March 2018 at 03:20, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Wed, 2018-03-28 at 11:58 +0300, Riku Voipio wrote:
> [...]
>> One option:
>>
>> +++ b/scripts/package/mkdebian
>> cat <<EOF > debian/rules
>> -#!/usr/bin/make -f
>> #!$(which $MAKE)  -f
> [..]
>
> Shebang lines are interpreted by the kernel, not by a shell.  So you
> can't do anything clever like that.

Look more closely ;) Shell expands the variables into the herefile. So
if make is picked from a nonstandard location, the debian/rules
shebang becomes #!/home/masahiro/bin/make -f

As I said the price of this hack is that if use make from non-standard
location, the source package won't build anywhere else. Then again,
you probably shouldn't use non-standard tools when building source
packages for others to consume.

Riku
