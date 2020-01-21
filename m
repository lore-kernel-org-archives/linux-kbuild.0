Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45315 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgAURLO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 12:11:14 -0500
Received: by mail-wr1-f65.google.com with SMTP id j42so4075569wrj.12
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2020 09:11:12 -0800 (PST)
Date: Tue, 21 Jan 2020 17:10:56 +0000
From: Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Message-ID: <20200121171048.GF6796@tack.einval.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
 <220e3aea-b273-417a-69c9-059236c888af@st.com>
 <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
 <20200120182837.GO3697@linaro.org>
 <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f09ce50c-6721-c9d3-4f27-3f98a2d0b183@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, linux-arm-kernel@lists.infradead.org

[ Adding lakml to the CC list ]

On Mon, Jan 20, 2020 at 09:20:55PM -0600, Frank Rowand wrote:
>On 1/20/20 12:28 PM, Steve McIntyre wrote:
>> On Mon, Jan 20, 2020 at 10:14:22AM -0600, Frank Rowand wrote:
>>> On 1/20/20 4:56 AM, Alexandre Torgue wrote:
>>>
>>> Here is an example of the info from one of my builds:
>>>
>>>   From Linux 5.5.0-rc2-dirty by frowand the Mon Jan 20 09:50:58 CST 2020.
>>>
>>> The information 'Linux 5.5.0-rc2-dirty' is precisely what was most objected
>>> to in my proposal.
>> 
>> ACK. :-( I'm surprised to see so much push-back on what looks like a
>> simple piece of information here.
>
>Me too.

So, looking at the comments back on the old thread...

Alexandre is proposing somthing slightly different here: a patch to
add a simple string to allow for a description of where the DTB came
from. The particular example he uses here fills in build details from
the Linux repo, but it could just as easily be filled in as part of a
U-Boot build, or the build of a DTB included with EDK2, or whatever
other firmware might include it. It might be useful to also add
similar debug output into U-Boot, or for that matter any other
DT-using project.

As Rob says later, it's simply information for humans to help identify
where a DTB came from. Nothing more.

>> I've had users *specifically* asking for this kind of identification
>> so that they can verify the version of the DTB they're using at
>> runtime. Right now it can be a guessing game, which does not help
>> people trying to debug problems.
>
>If the information was reported as debug information via pr_debug(),
>would that work for your use case?  Or would the users' kernels
>not have debug enabled in the configuration?

Quite possibly not - I'm not 100% sure to be honest. :-/

-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
