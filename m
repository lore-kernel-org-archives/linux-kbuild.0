Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619728;
	b=yMVyf2+XUj+FxgvrAXw49/Ye8wlqQ4vcqHt+80OskTr1UxS+5y0X8zmmYHOaY51Sd/kW
	 6TZ2vTuOA0/Ap2V5SWw165i0AOS+NWSWlNhglK1H8c3+DpnT+T0kgak2t6ZC0Vm0hTw1x
	 1yNNRh3JJo9Nx+3jdd0MAOCCJc3dxVS7ithE4eQA/+JquqFZY6BklcqWZFGleFjvcDyPl
	 ZMupUVu3woWu6hfq1kF0NweG11XSzw2JQBhOUPYxsZoLbIPOtVObkaw7qGi+e+5Ax2Kry
	 vTgyuXMwJP38yqWXkB3X8poetvfFDCPJu3CM3I4dnwpZYJhh5SAsTR8ssOnjn3NXRag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619728;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7uvnNu55LPxsE6Gptb/+zdNR3IAgjEJMH78SWGNREho=;
	b=t4l4M4lix/kGkDak2t+LmqbGjjBWZP5ri0PDTNcKjKAwqzqhd+5WtiL43pvsu7bY0AKx
	 MB99ddFbB6cMKCaJm9V/fFlbH5SWxWF2zbKh9UI6vaGm+HQR+FGo3lKDTTmuqBZPzInKa
	 j3YyOuEaXPmSg3Xb0lDrIxrojgXySVDBsqXFN1wcN69MRNFTq9ilsPltIfAD+56Nyvee0
	 dAOy6R6ZcfgZO1uGlO8RzykJNjZsKVpX69OzosIfguThKtbXWpWJb/sLGQ9vZ8DMhaco9
	 zVZ8OptEVXHu8D039IcWZkozNghayp4Djh99gCG83TYAxmSOdM//cXeJ8HhDJHlj1tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sik8nT0k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068F606A31B;
	Wed, 21 Oct 2026 21:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sik8nT0k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1888C1F000C5;
	Wed, 21 Oct 2026 21:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792619728;
	bh=7uvnNu55LPxsE6Gptb/+zdNR3IAgjEJMH78SWGNREho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sik8nT0kQ0G1LyuiOruEIOsXwp2GzIqm6OxmljmOu6Bl7HeW74fi7CRy2jS9J4HGn
	 NRU3tCyrnMqUq2KHddCWSVgAotl+iGRraqDvfB6LvjcqHK7AdfWaEhgthBLncniPEU
	 w9gwLyVYMFvSWVMtbt5ERSu38tn+DDXnmkjB+0hau8cBwSt0RnOEXhX5a7y8oj/qFn
	 796TACgNDIEulfu0FVcM/tVMnODmQZbiMYpNNcWrMa7c+hG59Dl15Hyc5QUxbKPsLc
	 XOAqXe9srSBg+4UB8JRUV/lP/q33dRqX3ViFYW1OXZUCaleAEGKP3/qmO/V6rJ4yhd
	 TNKIkSsyJMDKg==
Date: Wed, 21 Oct 2026 14:55:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mathias Krause <minipli@grsecurity.net>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: prevent building single targets twice
Message-ID: <20261021215524.GA627677@ax162>
References: <20260923123936.2227924-1-minipli@grsecurity.net>
 <5836ab69-cfa6-41cc-a28b-5bd3ecfaea03@grsecurity.net>
 <atjwobCk-mdeIlkd@levanger>
 <20261021190311.GB2611266@ax162>
 <aad229bb-27c2-4c5f-bfce-73d2a0d04996@grsecurity.net>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aad229bb-27c2-4c5f-bfce-73d2a0d04996@grsecurity.net>

On Wed, Oct 21, 2026 at 11:25:13PM +0200, Mathias Krause wrote:
> On 21.10.26 21:03, Nathan Chancellor wrote:
> > On Wed, Oct 21, 2026 at 07:04:33PM +0200, Nicolas Schier wrote:
> >> On Wed, Oct 21, 2026 at 08:53:56AM +0200, Mathias Krause wrote:
> >>> Ping! I know, it's the merge window but this patch may have fallen
> >>> through the cracks as there was no response so far. Just trying to take
> >>> care it doesn't get lost.
> >>
> >> thanks for the ping.  The patch is in my review queue for the upcoming
> >> cycle.
> > 
> > Same, I will try to review it this week or next once I clear my tip of
> > tree clang regressions backlog and Kbuild merge window madness.

I forgot to mention, it looks like this is a known corner case in Kbuild
that has come up before:

  https://lore.kernel.org/7b663b86-4df0-c3df-18a7-e4f47f900be4@kernel.org/
  https://lore.kernel.org/CAK7LNAQhORSPEuB=XFa_i5EcQfsJ6uXy0MM5YWo_84eLGcoxNQ@mail.gmail.com/

This patch might be the fix that Masahiro could not figure out but it
might be better to just forsake drivers-y here and use obj-y properly,
especially since it looks like core-y is not even used for x86 anymore
(but maybe these objects still need to linked towards the end of the
kernel?). This diff appears to resolve the reported issue but I did not
try running the result.

diff --git a/arch/x86/Kbuild b/arch/x86/Kbuild
index 36b985d0e7bf..bd0621207c0c 100644
--- a/arch/x86/Kbuild
+++ b/arch/x86/Kbuild
@@ -36,5 +36,12 @@ obj-$(CONFIG_KEXEC_FILE) += purgatory/
 
 obj-y += virt/
 
+obj-$(CONFIG_PCI) += pci/
+
+# suspend and hibernation support
+obj-$(CONFIG_PM) += power/
+
+obj-$(CONFIG_VIDEO) += video/
+
 # for cleaning
 subdir- += boot tools
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b7e08519b8c1..9a872bd9520e 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -279,14 +279,6 @@ archprepare: $(cpufeaturemasks.hdr)
 
 libs-y  += arch/x86/lib/
 
-# drivers-y are linked after core-y
-drivers-$(CONFIG_PCI)            += arch/x86/pci/
-
-# suspend and hibernation support
-drivers-$(CONFIG_PM) += arch/x86/power/
-
-drivers-$(CONFIG_VIDEO) += arch/x86/video/
-
 ####
 # boot loader support. Several targets are kept for legacy purposes
 
-- 
Cheers,
Nathan
