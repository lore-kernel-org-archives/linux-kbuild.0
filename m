Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D3640D573
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 23:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781048760; cv=none; b=VzhCBzKjdn6VMZXBrALJQ0aoITG4rOSsqRw92gZ0d4Ka7cVgEAaPxj2xc72NDc4egK+k5S9Otrltag8UNUop34lcnxRJx/XoVtCRwfP3GHQCU/q9NLHM2077OECkJBRUv15S5zqLAIduKZqtQSxmclNq3ulDrg/sQKHSCdwz/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781048760; c=relaxed/simple;
	bh=oF1RjhrSJ4R7DYmQphBsOCymelSqvxKUeXvnyp3hE7Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BQiQYl9XKBhzibeVSX3apjXRKoVaQAEDyWjia+SnaI3ZTXJ+6IkxAewwujMAslv6UIsKHdqAR13471D46ltBuOlBk2REhugsbv3i0uijINLUaQovizxwl9Uef5eW1epiGZdyrGeUlvlT78qM3PkINe/BUMYZ3w2s5tpklschBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xrw3TOTp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xrw3TOTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8FD1F00893;
	Tue,  9 Jun 2026 23:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781048759;
	bh=okrdmXcbvbNBrQXbTDGEV98CkjzCpkP3tYJDsc4eTOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xrw3TOTp0vQ8OqSICV1jwfUNv0H6mHXrWyqvhva+jLrKZXzT8j+vIYKGzZdrsRN2/
	 Gj+TCakZphAinuqjQzPGQ3aBcvUcJYICoIXBHdFnuL2xB7M2WlAMmbhdse/Wh2n5Ve
	 fhDS5x4j13OvNTF8wm36pDx724BsuBWpoNWZ4kT9fzvA+Kj9rb3qNrMOi7ntOxg3yQ
	 U3iLNcxgGhPUHItOAnYrXdaUMW8++Nv8FSad02B8uMVEmPDb3B8h/sNsEUyCRskGM0
	 WI73By+K5ACuk1PNI5uid4vyDJD8evE15wNKlueCAdNnjIwWXGyn1T5zXMCGJ85ni2
	 /j8+zygD/n6kg==
From: Nathan Chancellor <nathan@kernel.org>
To: nsc@kernel.org, Yafang Shao <laoar.shao@gmail.com>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20260526062732.84006-1-laoar.shao@gmail.com>
References: <20260526062732.84006-1-laoar.shao@gmail.com>
Subject: Re: [PATCH] kbuild: rpm-pkg: append %{?dist} macro to Release tag
Message-Id: <178104872566.2707941.4360276121925795793.b4-ty@b4>
Date: Tue, 09 Jun 2026 16:45:25 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=721; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oF1RjhrSJ4R7DYmQphBsOCymelSqvxKUeXvnyp3hE7Y=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkaS7eee1bor/HiYOypbSfe/cl1t499vuHk+9ilxwIyk
 m645gW87ihlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATufWckeGuy73X4hMl/s5S
 8HyffqNVYfPZwzdtnghf/vvG1LYsp7iE4X95fwaX/NUNtu18e3TSVnQxSH//LnItyV36SWZJU+f
 mYh4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 26 May 2026 14:27:32 +0800, Yafang Shao wrote:
> kbuild: rpm-pkg: append %{?dist} macro to Release tag

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: rpm-pkg: append %{?dist} macro to Release tag
      https://git.kernel.org/kbuild/c/159921d63da16

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


