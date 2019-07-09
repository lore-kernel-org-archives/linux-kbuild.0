Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:58287 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfGIKUz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 06:20:55 -0400
Subject: Re: [PATCH v4] builddeb: generate multi-arch friendly linux-libc-dev
 package
References: <CAK7LNARgFmSm+kCngidevQ3HnNjqKDKfGzYXrFPzhgBRHmccXw@mail.gmail.com>
 <1562658215-186-1-git-send-email-Cedric_Hombourger@mentor.com>
 <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <37f96102-34bf-db52-720a-d8c83965f8dc@metux.net>
Date: Tue, 9 Jul 2019 12:20:43 +0200
MIME-Version: 1.0
In-Reply-To: <1562658215-186-2-git-send-email-Cedric_Hombourger@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cedric Hombourger <Cedric_Hombourger@mentor.com>, yamada.masahiro@socionext.com
Cc: ben@decadent.org.uk, isar-users@googlegroups.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, riku.voipio@linaro.org

On 09.07.19 09:43, Cedric Hombourger wrote:
> Debian-based distributions place libc header files in a machine
> specific directory (/usr/include/<libc-machine>) instead of
> /usr/include/asm to support installation of the linux-libc-dev
> package from multiple architectures. Move headers installed by
> "make headers_install" accordingly using Debian's tuple from
> dpkg-architecture (stored in debian/arch).

Is it correct the packages currently are not multiarch-compatible ?

If so, your patch would be another step towards completely replacing
the downstream's utterly complex build process :)

I'll give it some test cycles.

thx.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
