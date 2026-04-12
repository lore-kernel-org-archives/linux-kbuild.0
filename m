Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F62E8B9B
	for <linux-kbuild@vger.kernel.org>; Sun, 12 Apr 2026 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776019000; cv=none; b=fFnIbrSuyO7sho8KWo+MtznIzpsobPCHdVWGCJHmmWzzu9fr5lXHCaMW8j46TvrwWENmFKSWGxRubzHMyQxbGTsoTc5z29G/bYsh8W5r0dxzr4tsaaQmcWHjk0mhjPkZHr6kZu1ISbS2cnQ7IBAasgdVj8vasIKOEql3BUBgoUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776019000; c=relaxed/simple;
	bh=9UEoJLzKsw0xiPDU8e/PW5CiRc4iwLFNjttH4cHqKY4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Zgne1BF7QEtTKjYb/Un27/ticVBFXLgLDFGM3qASzqv/8jVSO47gtIVmb8DpjNGLRrUmHmwMo/Yp3NTxciUyJttMTgLHPLfittlbi+R6ZsAHls+oMRy1JZddUnYtQivvEqVnfDCayZMD+v/MU3GXvKgvePUB6GLuvifkFWfrFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux486.org; spf=pass smtp.mailfrom=linux486.org; dkim=pass (2048-bit key) header.d=linux486.org header.i=@linux486.org header.b=Eiw93JJI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RC2jJ9Xe; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux486.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux486.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux486.org header.i=@linux486.org header.b="Eiw93JJI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RC2jJ9Xe"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D990E14000E7;
	Sun, 12 Apr 2026 14:36:37 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Sun, 12 Apr 2026 14:36:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux486.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1776018997;
	 x=1776105397; bh=60LIK8WuEIzxFiQiMwS2jj9EravPfq1OCxAA2HSfE1c=; b=
	Eiw93JJIWBNPFpknLJ9Vrtjvs942pOAk3xSa65IX/Hu0J+uJmX6fUwc02S1tr7zi
	R/uMNlbgE4NjZnInCKB04jFS0sV71QCkAwgV79Dkt+DnDFxqZE/xRSh2pYkl4VkA
	h9ckMxhJ5CE/aalynQ1323yLK9KLoaX7VBL3wKvgTvUe9mN+7y2JjsAsD+sKzo4O
	lczJoJA/gZb/FxtG1VrXRREeQ3QKWUi0v3CdX/+ygESuBLLY/lZOs2t4AJQSPNSc
	yMiCQQc+SwSKzV4eA0cCtkrGhw0vUK4hcRqNyHbwUvi3wpxFt045xjeK86px7Ris
	wx9k338siP5DLkLuwN74iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776018997; x=
	1776105397; bh=60LIK8WuEIzxFiQiMwS2jj9EravPfq1OCxAA2HSfE1c=; b=R
	C2jJ9XeHpQBZ9BXxyKFlg9XxceE1VcVMdPwIqYJ9ZgRN89FbG6hoVhVSHeb8EGox
	5q/EoVOWy3s4U9ZJX29m05FB6eoYf6wrD/FSKleIHqw7L6K/Nvg4dpDPfydeL09E
	HZDEbdYmxWWe6wiiATra4TiEvJexYg4hFr+4tJX39uhAIv+uADBLLHXUZT9OQaFX
	nB5PkmnrU3ueOm+l5IWhDFH2QK9/ItDFOIDibmRaVR+pju6Sc+kqyxlBDn2ZzJ+K
	mcom1SvMvGuVI2L5axDf1gGtfZryvuXjBKQZ7m4+GsyuUE5aYSKLg5XubR5GSJ3+
	fjtiUCKJOHGmsHj5+TrVQ==
X-ME-Sender: <xms:Nebbabxt11hnQDF5G01i06P3Rih9mZM9Wd6nGJHjj1z8lOydmC2WXw>
    <xme:NebbaeF0L21NfH-JMI0uW0e9yQ88QL9x_qn2XSifZVnnuPSp0-K5KvgALkfNqfqwc
    FVJ7fnmAi9hFXvX_mOYdKyBYmr_ypkH7ygV1SntWBSfT9Wm6M_Wc7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefiedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetnhgurhgv
    ficugggrlhgvnhgtihgrfdcuoegrnhguhieslhhinhhugiegkeeirdhorhhgqeenucggtf
    frrghtthgvrhhnpeekgeeihfevheegieeghedvhfegleffieetjeeluddufeeileetueet
    ledufeekteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhvshhtrgdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhguhies
    lhhinhhugiegkeeirdhorhhgpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehnshgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhksghuihhlugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Nebbaee7CHIZYYfuvk1pPeH9-Uwh0fRudGMh6wYRNWYxwYK1w4NKnw>
    <xmx:NebbaWLUVxlpu8OOoOJ9sLymBrbkA5Yu5A77uKvPS6yaFNSLeKwj8w>
    <xmx:NebbaXH3U2NCDaKUg00gXxjH9NbnTh5-GHB6kyCWNC_iCf8rwjN_og>
    <xmx:NebbaYrM03KRFqCM3xzcIOcYzqYydQ6k3vzuiuRNG1gj3IATNyes1A>
    <xmx:NebbaRK_haIi8trEbeEVl_UFbzWtlGyE1T3eBDQmoXr2iwXnsiAF5gKo>
Feedback-ID: ifbd64b11:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B9998700069; Sun, 12 Apr 2026 14:36:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AjK4HV-VrZTg
Date: Sun, 12 Apr 2026 11:36:16 -0700
From: "Andrew Valencia" <andy@linux486.org>
To: "Nicolas Schier" <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Message-Id: <cc85769a-3f61-45bc-8773-322d3435bd83@app.fastmail.com>
In-Reply-To: <advGKvtLfEb1vwNK@levanger>
References: <af3a3eea-ae34-4f94-b17c-43f154e80ff7@app.fastmail.com>
 <advGKvtLfEb1vwNK@levanger>
Subject: Re: Kconfig olddefconfig nukes 32-bit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

(Re-sending for rejection of an HTML part by the list management SW.)

Hi,

This is for x86 32-bit target, built _on_ a x86 32-bit machine.

The issue appears to be:

config 64BIT
        bool "64-bit kernel" if "$(ARCH)" = "x86"
        default "$(ARCH)" != "i386"
        help
          Say yes to build a 64-bit kernel - formerly known as x86_64

Which appears to say this config item is only enabled if ARCH is x86.  But this then makes the default value calculation invariant for any target with this config item--it is always true, and thus always 64-bit.

So things like CONFIG_X86_32 go away, and CONFIG_OUTPUT_FORMAT switch away from elf32-i386.  Even if you're on a 32-bit build machine with a proper .config brought over from a previous 32-bit x86 build.

When 64BIT is being introduced in olddefconfig, I'd hope it would key off of CONFIG_X86_32 or something like it.

Thank you for giving this a look!
Andy

On Sun, Apr 12, 2026, at 9:19 AM, Nicolas Schier wrote:
> Cc: linux-kbuild
> 
> On Sat, Apr 11, 2026 at 10:55:15AM -0700, Andrew Valencia wrote:
> > Hi,
> > 
> > I'm working over in the 6.19..12 world, and brought over a working
> > .config which I updated with olddefconfig.  Long story short, the
> > config was converted to a x86 64-bit config.
> > 
> > The issue is the new config entry 64BIT, which has a default value of
> > ARCH != "i386".
> 
> yes, there is a 64BIT Kconfig symbol defined at arch/x86/Kconfig which
> is true by default for non-i386 builds.  According to my git tree, the
> corresponding lines did not change since v4.18 [1].
> 
> [1]: https://git.kernel.org/kbuild/c/104daea149c45
> 
> > On my 32-bit x86 build machine with its 32-bit .config, the default Y
> > is being selected.  Is it possible i386 is not the correct name for
> > ARCH on this target?
> 
> I guess, that you want to cross-build a 32bit-Linux on a 64bit-machine,
> right?  How did you call olddefconfig (e.g. make ARCH=i386 olddefconfig)?
> 
> Kind regards
> 
> -- 
> Nicolas
> 

--------------------------------
Andy Valencia
https://vsta.org/andy/
