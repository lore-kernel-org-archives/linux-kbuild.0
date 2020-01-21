Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36626 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728904AbgAURTN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 12:19:13 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so4031766wma.1
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2020 09:19:12 -0800 (PST)
Date: Tue, 21 Jan 2020 17:18:39 +0000
From: Steve McIntyre <steve.mcintyre@linaro.org>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
Message-ID: <20200121171833.GG6796@tack.einval.com>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200119063916.GD54439@umbus>
 <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: David Gibson <david@gibson.dropbear.id.au>, Alexandre Torgue <alexandre.torgue@st.com>, Frank Rowand <frowand.list@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Devicetree Compiler <devicetree-compiler@vger.kernel.org>

On Tue, Jan 21, 2020 at 09:59:44AM -0600, Rob Herring wrote:
>On Sun, Jan 19, 2020 at 12:41 AM David Gibson
><david@gibson.dropbear.id.au> wrote:
>>
>> It's not really about who consumes it.  It's about defining a
>> namespace for the new property to exist in, since it's not part of a
>> relevant standard (if we wanted to make it such, we should pin down
>> what goes in there with much more precision).
>
>I can't think of any cases of the 'linux' prefix not being about who
>consumes it. And we often end up dropping 'linux' because it turns out
>to not be Linux specific. I don't care to see u-boot,build-info,
>freebsd,build-info, etc. when a given dtb can only have 1 of those.

Yes, exactly. What would happen if somebody (tried to) fill in more
than one of XXXX.build-info? It makes no sense.

>My intent is this property name is added to the DT spec, but I don't
>agree we should define what's in it beyond a string. It is information
>that is useful for humans identifying what the dtb was built from.

Nod - defining this as a free-form string lets people put their own
information in, without us having to try and agree on a full spec
which we'll need to update as ideas change.

-- 
Steve McIntyre                                steve.mcintyre@linaro.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs
