Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44418 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgATS3F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 13:29:05 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so460722wrm.11
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2020 10:29:04 -0800 (PST)
Date: Mon, 20 Jan 2020 18:28:46 +0000
From: Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 0/3] Add device tree build information
Message-ID: <20200120182837.GO3697@linaro.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
 <220e3aea-b273-417a-69c9-059236c888af@st.com>
 <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1233cd8-e73a-82d7-74bf-69109d1a0a07@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, david@gibson.dropbear.id.au, sjg@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org

Hi Frank!

Thanks for the link back to the previous discussion, it's very
helpful.

On Mon, Jan 20, 2020 at 10:14:22AM -0600, Frank Rowand wrote:
>On 1/20/20 4:56 AM, Alexandre Torgue wrote:

...

>> and the date). There are no "dtb versions", and "absolute/relative"
>> path which created concerns. One remaining concern is "reproducible
>
>Here is an example of the info from one of my builds:
>
>   From Linux 5.5.0-rc2-dirty by frowand the Mon Jan 20 09:50:58 CST 2020.
>
>The information 'Linux 5.5.0-rc2-dirty' is precisely what was most objected
>to in my proposal.

ACK. :-( I'm surprised to see so much push-back on what looks like a
simple piece of information here.

I've had users *specifically* asking for this kind of identification
so that they can verify the version of the DTB they're using at
runtime. Right now it can be a guessing game, which does not help
people trying to debug problems.

Cheers,
-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
