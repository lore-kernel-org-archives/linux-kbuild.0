Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:57053 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfLDNsx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 08:48:53 -0500
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
 <20191204041543.GA1086470@ArchLinux>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <6ff74f67-11d3-d16f-8aeb-828c01455961@metux.net>
Date: Wed, 4 Dec 2019 14:48:16 +0100
MIME-Version: 1.0
In-Reply-To: <20191204041543.GA1086470@ArchLinux>
Content-Type: text/plain; charset=windows-1252
Content-Language: tl
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 04.12.19 05:22, Bhaskar Chowdhury wrote:

Hi,

> I think the usefulness comes from developers wants to see what are the
> modules are using by the running kernel in formatted way.
> This is very simple way to enlist all the modules with descriptions of
> it.So , they can easily parse it with other scripts.

IMHO, this is a good thing to have. I can even imagine it shipped by
distros, for better bug reports.

OTOH, if it's about the currently running kernel and loaded modules, why
not putting this into /proc or /sys ?


--mtx

-- 
Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/öffenen,
selbst wenn diese von vermeintlich vertrauenswürdigen Absendern zu
stammen scheinen. Andernfalls droht Totalschaden.
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
