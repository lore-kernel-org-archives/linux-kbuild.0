Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:16218 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgAVSAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jan 2020 13:00:55 -0500
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus> <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200120181708.GN3697@linaro.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <9d83a36c-78c5-3452-bb48-209d68c46038@st.com>
Date: Wed, 22 Jan 2020 19:00:18 +0100
MIME-Version: 1.0
In-Reply-To: <20200120181708.GN3697@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steve McIntyre <steve.mcintyre@linaro.org>, Rob Herring <robh+dt@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, Frank Rowand <frowand.list@gmail.com>, ian@freebsd.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

Hi

On 1/20/20 7:17 PM, Steve McIntyre wrote:
> On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
>> On Fri, Jan 17, 2020 at 6:26 AM David Gibson
>> <david@gibson.dropbear.id.au> wrote:
> 
> ...
> 
>>> What might be better would be to have a dtc option which force appends
>>> an extra .dts to the mail .dts compiled.  You can then put an overlay
>>> template in that file, something like:
>>>
>>> &{/} {
>>>          linux,build-info = /incbin/ "build-info.txt;
>>> }
>>
>> I like this suggestion either as an include another dts file or an
>> overlay. The latter could be useful as a way to maintain current dtb
>> files while splitting the source files into base and overlay dts
>> files.
> 
> ACK, that sounds like it could be helpful.
> 
>> But no, let's not prepend this with 'linux'. It's not a property
>> specific for Linux to consume.
> 
> Right. We might be seeing the data coming through from U-Boot (or any
> other random bootloader) too.
> 
> Cheers,
> 

Thanks for reviews. I gonna prepare a V2 with David proposition (to use 
overlay format) by keeping in mind not to modify existing dts(i) files.

Remaining questions are:

1- "build-info" or "linux,build-info"? IMO, If information is "generic" 
then first one should be used.

2- Looking at Franck proposition[1] some years ago and objections on it, 
do you think that this one could accepted ?

regards
Alex

[1] https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
