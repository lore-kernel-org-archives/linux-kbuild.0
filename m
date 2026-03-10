Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533A295DAC;
	Tue, 10 Mar 2026 18:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773167064; cv=none; b=s95GXDUrrVBCdBeJ88GUpQPMBvJp5O6HBFJXhA/tTvx/bdwsUwrYnNKFwwU9pnUVnGPJnsJU6avnIVpDWp+Qvhl5xykY3Ci8q+NjKi8UtGK1Hf9uLkygezy+lqZqN9QS8VaGaGUeKN2Pc6j3qrFvqan5Fwtm7u1R2c/hrX6AJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773167064; c=relaxed/simple;
	bh=CBLgVSzk+uzgEcjVI4lMlH3aOZqVypXHnT8n1Tb7lQo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QR2vSl0VbLKieLlL470Z/VVgy6Fcswq5uDhUuO0P7T3hF8Ge0FaQXzXbx5m5PraYrOqVLbcng9zW6NMLbKNDGB55ybnDJVJFVq1PoH9oS8SgPdPqlL5tukp+2PJp1ldEsS+YmTou/fk+103op6Hl6UdNyRvWnVh5OUYLz93bb1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pGuw+f+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pGuw+f+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EA0C19423;
	Tue, 10 Mar 2026 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773167064;
	bh=CBLgVSzk+uzgEcjVI4lMlH3aOZqVypXHnT8n1Tb7lQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pGuw+f+hlFO49DBTuISwVhCRRSm3fU7+z8TUiRua0/pRhS9XlHJYtLB++MyKym8Pv
	 lILVY26TmefkmAOwH7jgNgU8V1HrW19mRkYMWkDOO2ubbtcP9EgqQTMVJOSHH66SJi
	 NZIkR0SD5G/HXfc9UTT9oO9P0iMy4Kh8WO0QWBBQ=
Date: Tue, 10 Mar 2026 11:24:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: urezki@gmail.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 samuel.holland@sifive.com, dave.hansen@linux.intel.com,
 jeremy.linton@arm.com, peterz@infradead.org, weixugc@google.com,
 ljs@kernel.org, ryabinin.a.a@gmail.com, rppt@kernel.org, bp@alien8.de,
 luto@kernel.org, jan.kiszka@siemens.com, mingo@redhat.com,
 david@kernel.org, mhocko@suse.com, andreas@gaisler.com, kas@kernel.org,
 Liam.Howlett@oracle.com, morbo@google.com, thuth@redhat.com,
 catalin.marinas@arm.com, ankur.a.arora@oracle.com, kbingham@kernel.org,
 nick.desaulniers+lkml@gmail.com, andreyknvl@gmail.com, dvyukov@google.com,
 corbet@lwn.net, leitao@debian.org, hpa@zytor.com, tglx@kernel.org,
 yuanchu@google.com, ardb@kernel.org, vincenzo.frascino@arm.com,
 tabba@google.com, joey.gouly@arm.com, nsc@kernel.org, will@kernel.org,
 yeoreum.yun@arm.com, nathan@kernel.org, maciej.wieczor-retman@intel.com,
 skhan@linuxfoundation.org, axelrasmussen@google.com, osandov@fb.com,
 surenb@google.com, justinstitt@google.com, kees@kernel.org,
 vbabka@kernel.org, hsj0512@snu.ac.kr, trintaeoitogc@gmail.com,
 jackmanb@google.com, maz@kernel.org, glider@google.com,
 linux-doc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v11 00/15] kasan: x86: arm64: KASAN tag-based mode for
 x86
Message-Id: <20260310112421.8ceb7415e14b49cbd86db715@linux-foundation.org>
In-Reply-To: <cover.1773164688.git.m.wieczorretman@pm.me>
References: <cover.1773164688.git.m.wieczorretman@pm.me>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 17:51:19 +0000 Maciej Wieczor-Retman <m.wieczorretman@pm.me> wrote:

> 
> [1] Currently inline mode doesn't work on x86 due to things missing in
> the compiler. I have written a patch for clang that seems to fix the
> inline mode and I was able to boot and check that all patches regarding
> the inline mode work as expected. My hope is to post the patch to LLVM
> once this series is completed, and then make inline mode available in
> the kernel config.
> 
> [2] While I was able to boot the inline tag-based kernel with my
> compiler changes in a simulated environment, due to toolchain
> difficulties I couldn't get it to boot on the machine I had access to.
> Also boot time results from the simulation seem too good to be true, and
> they're much too worse for the generic case to be believable. Therefore
> I'm posting only results from the physical server platform.
> 
> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86. Patchset does seem to compile with gcc without an issue but doesn't
> boot afterwards.

So LLVM works partially and gcc doesn't work at all?

Do we know which compiler people are using?  Google tells me that
Android, ChromeOS, and OpenMandriva use LLVM.  That's pretty thin.

This is all rather problematic and it isn't clear (to me) how to
proceed at this time.  Do we have any projections on when all this will
be fixed up?

> The series is based on mm-new.

I actually carry kexec patches in the mm-nonmm-[un]stable branches. 
But the series applies OK anyway.

