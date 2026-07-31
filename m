Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A959416857;
	Fri, 31 Jul 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494041; cv=none; b=EnXwdAuJlF/yc3u1wFZ9kg156Icsj+MEcA/w+mme1tOOwxn+bEoHM8SN4XOc9kpxGUSiSrKqggHhSG2yd+0PUbRie7qrOQVSDKQK0Ehr4IWb7IaWssPsSt6ex6EH7O1XpN5OCrotAyIOTELXd+TvGaEiPD11T+0n4uDr8s0xtkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494041; c=relaxed/simple;
	bh=EWHAT9zISehbazohcL0ZK2/Eu4oaxgyF3e/L1zw4deI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Q6K97dtFIe4Ef9FL85P0FOJ66bZR2wv1fcG4pWvdKFhZs8n3+pfyQ6H27g2eSNHUGSNnvLaAwuLk00lZ9SVcwMuNCsPcHpQFtDQxxN7/OYgUlrDrRqtP6x8d7SLsD29VVtALmFaXoMbdiMQADFN2gkOyYJ/aZeNC8NAOo+sHyfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Ij+tZ6TK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZUg08VX0; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Ij+tZ6TK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZUg08VX0"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1B5A9EC0099;
	Fri, 31 Jul 2026 06:33:37 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 31 Jul 2026 06:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785494017;
	 x=1785580417; bh=fRkbjbM3Ek1+ircvljzCclMWH898hvdpeWVxglMvLwc=; b=
	Ij+tZ6TKF9cUjepHXSDmjRC4YrXr/78NXT8iJwJi/yPuu4LBuApUfkZtXPjg/4qF
	a/o/+43AKk3mz9Sws+eM+TRsD1Q9JPO/EWzxNUdKqbC/GxQgST5Ut9AKUT31ulhl
	IhTjrx4YsqSSDEKM4N9CgedMiih4UVITxWdpNResTiMkllWkHKh9vkXLOSpXrX/l
	7MH+pvTLKfQLyx2DBM8twyji2wuQxs1328KaKGIo4KA84oJYV9HPrFIwxRkUnfds
	24KHtjrOjenWJaDH73jJwBcdZ0PpWHvHIgHl4IPu6D4d3YbUd8VtZGhY3y18xFw8
	m8h0ImQ3mC6DNAp5w8tV+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785494017; x=
	1785580417; bh=fRkbjbM3Ek1+ircvljzCclMWH898hvdpeWVxglMvLwc=; b=Z
	Ug08VX00J2B9UFqjBrLk9od356ruwXqOyBwZyw49CRo06QEsDqfY2/2V5D4t6fCH
	vC7W4ppHb3/k297uMojLDxkOCgPoZoIt2UTSnSsHG3QZEe0F7QL8MGun1ccJLAoa
	WLUovBDs7LnBbXRjlwn4XRaiwR6+FRGF2jmEVrgMsjAGYPF8/SvUQIIb6lWgnmQH
	ScBrxDFA6JW/n9FhpmXiSjXqpG4OFhbYXVXDRkZCxu7d1neFV2XW9/HpDI2LpA2D
	OgB/rktlmthvpnN+igMBv4Or+LlJ9mq3xH+bjjeyr2vcm23Opu6whpY2BMvzDqY1
	kTR+GLWL3tqqt6uzjE/MA==
X-ME-Sender: <xms:_3lsajNnYyz769Ic3abDEFYO0OhYIge4jaFw3JFTiAFEVWMLymHfig>
    <xme:_3lsaoyWnW06IHiQ96WDe3K1mrqI956TxGQd9hKkdyZRoM9jLqwR6awFkVpPKjTcw
    uwouMDT8JEcrf1G8B5ftmKlJld8h1Om47luLPWdlc7ZAazLmQGyLyI>
X-ME-Proxy-Cause: dmFkZTGT8YwHAAsEm3rVDPUnQchmR0iyDLaHRiKiOoictZ6yGIdoo5nnOi24zP+jRd+d2e
    c7xn9+TzMVrFx6E1pywDmq/ii10y6eUpCctzGlEFP0PQnObHimAxbqf1iKtFhrDwe43FAq
    mclxyQ0JPuUp2HSYXMFL51f6JDOaRBn+E4cRzVert+XRyf+iyqfXS0mCcPU98s9gnOwQei
    Uyfn7iS3Ry6Zl6cjGOWhP9961O3iBZiyWzQNPDZf/w4AjiGqZhKI6I1Bhf8G3oiE6Uq+uy
    r7xdnUBffa7uYjzF8zmnJ9tVltc7svMKSlIQbITHg5CcJO4o4jpDG4kJsVRJ5emTrA++qC
    5V3V5KqFVZbZGWdiiAs7KJnCB49GMbqLktdfEyRuwGhqViicx8Gj1XK65wu48JFHG1X2bz
    vIdaUaCcdz+7SR6LMMAK3EJSD6JoMooNfd0OA36x4c/nrAZiQU24hG3E3jDaZjzfUJtzFA
    uBKj+Ia2YUDBicyJX1hgiL7iM6Hsd5knBgJahcMi5s5LCsB7m7/xAzjxIaVVb2JbjfYyQ9
    ClWYrhoh3N1GB+pB4cLejKDOwYhEVpNZKyu6LlcgybEaoAOmFPzk0pN6oRcOrop0AG4jQg
    H9ic6RK7zO7ACiO2aikyPl+tiVN7B/aV5jDfeFbr+pL/VPTW4ZswqOkY5xWg
X-ME-Proxy: <xmx:_3lsakQIO2Ob0hoFX3KIyATZrwPupWbXbG_h1sEwTO6y2V5GYS-rTA>
    <xmx:_3lsarLopbHyccsKIK4iTqNF-50HB45eQyJC_SZXRTuyP4ov91X6HA>
    <xmx:_3lsaqU9y2LiJREhdAA2QyuQ5-f09sNBFzSfcWppnJcHZmt4lyovCA>
    <xmx:_3lsanj7P9AM03-BWzhLy556kyZSckmptAGvsiJmQtTuXKModVttfw>
    <xmx:AXpsajDiQGAqxgBX2BLaZWd0HqBv7-krU06jv5Y5HEC-Jhpw5yRDH58Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BD3E6182007E; Fri, 31 Jul 2026 06:33:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASxzv5og6Sd3
Date: Fri, 31 Jul 2026 12:33:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Nathan Chancellor" <nathan@kernel.org>
Cc: "Nicolas Schier" <nsc@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Jani Nikula" <jani.nikula@linux.intel.com>, stefan.hengelein@fau.de,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, "Nicolas Pitre" <nico@fluxnic.net>,
 officialnaumansabir@gmail.com, "Randy Dunlap" <rdunlap@infradead.org>,
 "Vegard Nossum" <vegard.nossum@oracle.com>, "Kees Cook" <kees@kernel.org>,
 "Tejun Heo" <tj@kernel.org>
Message-Id: <dd9e809e-82dd-4010-8a26-f7a477e75c47@app.fastmail.com>
In-Reply-To: <b756801d-873a-4b77-9385-d4a43f7dd28e@gmail.com>
References: <20260730140108.683967-1-julianbraha@gmail.com>
 <178545753473.3004192.2499981065379649802.b4-review@b4>
 <b756801d-873a-4b77-9385-d4a43f7dd28e@gmail.com>
Subject: Re: [PATCH] Documentation: warn against using int, hex, string options as
 expressions in Kconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jul 31, 2026, at 11:43, Julian Braha wrote:
> On 7/31/26 01:25, Nathan Chancellor wrote:
>>> This 'if FOO' will always be false, regardless of FOO's value (even when
>>> FOO=1). The same goes for strings and hex.
>> Hmmm, it might be kind of nice to either:
>> 
>> 1. Warn about this in Kconfig directly (if possible)
>> 2. Support this usage in Kconfig how one would intuitively expect from
>>    either C or Python where symbols with values of 0, 0x0, and '' would
>>    be treated as false and every other value set as true.
>
> Agreed, an interpreter change for this is on my roadmap. Though I was
> also considering to make this error out.
>
> Would be good to get some more feedback from others on which approach is
> preferred (Jani, Arnd?)

I'm fine with either of the two approaches, both seem better than
to document the current behavior just to change that again later.

If it's going to cause a hard error, we have to be sure to fix
all existing instances first, otherwise a warning would be better.

       Arnd
