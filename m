Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:11151 "EHLO
	tx2outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751235Ab2HOMEN convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Aug 2012 08:04:13 -0400
From: Tabi Timur-B04825 <B04825@freescale.com>
Subject: Re: [RFC:PATCH 3.6.0-rc1] dtc: Add -P option to dtc for
 Pre-Processing.
Date: Wed, 15 Aug 2012 12:04:07 +0000
Message-ID: <502B9037.9020502@freescale.com>
References: <1344844913-16938-1-git-send-email-srinivas.kandagatla@st.com>
 <20120815011149.GF8136@truffula.fritz.box>
 <CAOZdJXUxguEBJG44kyKH0NW1999a9OBj2M=DEhmf_uSYM6nGaQ@mail.gmail.com>
 <502B70B8.1030709@st.com>
In-Reply-To: <502B70B8.1030709@st.com>
Content-Language: en-US
Content-Type: text/plain; charset=US-ASCII
Content-ID: <DF7454348E599E4B8431BFEFBB875C40@mgd.freescale.com>
Content-Transfer-Encoding: 7BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "srinivas.kandagatla@st.com" <srinivas.kandagatla@st.com>
Cc: David Gibson <dwg@au1.ibm.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Srinivas KANDAGATLA wrote:
>> >Using this option would break a lot of our device trees.

> As this is optional parameter, I did not expect it to break the
> default/existing behavior.
> Correct me am missing anything?

I'm just concerned that someone might accidentally set it and then wonder 
why strange things happen during boot.

-- 
Timur Tabi
Linux kernel developer at Freescale
