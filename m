Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55221 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgATSSG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 13:18:06 -0500
Received: by mail-wm1-f65.google.com with SMTP id b19so278900wmj.4
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2020 10:18:04 -0800 (PST)
Date: Mon, 20 Jan 2020 18:17:14 +0000
From: Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Message-ID: <20200120181708.GN3697@linaro.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Alexandre Torgue <alexandre.torgue@st.com>, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
>On Fri, Jan 17, 2020 at 6:26 AM David Gibson
><david@gibson.dropbear.id.au> wrote:

...

>> What might be better would be to have a dtc option which force appends
>> an extra .dts to the mail .dts compiled.  You can then put an overlay
>> template in that file, something like:
>>
>> &{/} {
>>         linux,build-info = /incbin/ "build-info.txt;
>> }
>
>I like this suggestion either as an include another dts file or an
>overlay. The latter could be useful as a way to maintain current dtb
>files while splitting the source files into base and overlay dts
>files.

ACK, that sounds like it could be helpful.

>But no, let's not prepend this with 'linux'. It's not a property
>specific for Linux to consume.

Right. We might be seeing the data coming through from U-Boot (or any
other random bootloader) too.

Cheers,
-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
