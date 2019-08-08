Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:53681 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfHHOJj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 10:09:39 -0400
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
Message-ID: <892b823a-a319-f9d1-51c0-5bf11b291e4c@metux.net>
Date: Thu, 8 Aug 2019 16:09:33 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Albers <thomas.gameiro@googlemail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 04.08.19 05:57, Masahiro Yamada wrote:

Hi,

> See line 7-20 of scripts/kconfig/mconf-cfg.sh,
> it tries pkg-config first. If pkg-config cannot find ncurses,
> it falls back to some hard-coded install paths.

Whoooh! One of the most important lessons I've learned aeons ago when 
crosscompiling comes in:

Always use pkg-config exclusively, whenever you can (in worst case,
let distros add .pc files to packages that yet miss it) and *never*
try to guess anything.

Crosscompile environments need to tweak a lot of things, especially
pathes - pkg-config is the perfect central knob for that (aeons ago
I've added sysroot support to pkg-config, so it automatically adds the
sysroot prefix to all pathes).

Note that we have two pkg-config instances (.pc file sets) involved
here: one for the target, one for the host. (in crosscompile 
environment, $HOST_PKG_CONFIG shall give the command for the host,
$PKG_CONFIG for the target).

Not sure why the pkg-config doesn't find ncurses in this case, but
I suspect a mixup between host and target.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
