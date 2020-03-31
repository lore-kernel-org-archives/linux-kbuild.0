Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40242 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729299AbgCaBEG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 21:04:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id a81so784814wmf.5
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2020 18:04:03 -0700 (PDT)
Date: Tue, 31 Mar 2020 02:03:56 +0100
From: Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH v2 0/4] Add device tree build information
Message-ID: <20200331010347.GF4037@linaro.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <1b946fcf-47a9-012d-1b04-f4bbd2682607@gmail.com>
 <67d75f0c-7478-23b0-8619-746cf83cedb5@gmail.com>
 <dba17be2-067f-8221-f313-7a3edcf61511@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dba17be2-067f-8221-f313-7a3edcf61511@st.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Frank Rowand <frowand.list@gmail.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org, Ian Lepore <ian@freebsd.org>

Hi Alexandre,

On Mon, Mar 02, 2020 at 01:55:55PM +0100, Alexandre Torgue wrote:
>On 2/28/20 6:47 PM, Frank Rowand wrote:
>> > This would require modifying every single main .dts file to get the build info
>> > I would prefer the method that Ian and David came up with (sorry, no lore link,
>> > it did not go to lkml).  Extract from David's email:
>> > 
>> >     Date:   Tue, 21 Jan 2020 13:05:25 +1100
>> >     From:   David Gibson <david@gibson.dropbear.id.au>
>> >     Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
>> > 
>> >     > Given that dts files are run through the C preprocessor before being
>> >     > fed to dtc, the build script could use the '-include' flag to force-
>> >     > include a fragment containing generated build info without any need to
>> >     > modify existing dts files.
>> > 
>> >     Uh... maybe.  -include will essentially prepend the forced file, which
>> >     is a bit awkward for our purposes.  It means that the prepended file
>> >     would need the /dts-v1/ tag, and we couldn't have it in the main files
>> >     which would be a bit confusing.  I think it would also cause problems
>> >     with any /memreserve/ tags and means that the main tree could in
>> >     theory overwrite the build information which we don't necessarily
>> >     want.
>> > 
>> >     I guess we could build things the other way around: have the main .dts
>> >     file specified with -include and have the dts on the dtc commandline
>> >     be a fixed one with the build information.  It'd be a little weird,
>> >     though.
>> > 
>> > -Frank
>
>Yes. I try briefly this idea but I got issues with dts-v1 tag. I agree, it is
>cleaner to not modify input dts file. I can rework int this way.

Have you made any progress on this please?

Cheers,
-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
