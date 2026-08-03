Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0173502A5;
	Mon,  3 Aug 2026 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766327; cv=none; b=SEP5yiLonyeDNCBSAqEP8wijGUlCLrtzpSSPsQkQdsydEMSyCO+G8JkWcne69Y9xkkVv4w3BDShX5frgm6JUYG5U4ZkmOJcdWdtg0SlFM9ydJ8UphAWpcscDEdaQE8IaX9zGfcp+R+/4ANrJ8SrDP/jV44APq91yVJZYN+S3+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766327; c=relaxed/simple;
	bh=5V/KjI2OlNXU801RzIILIlPAuTO1KzQuBtYNkjQwzcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIFKwljSQhFeKg5FrdMhCWC1/OFGf7Hh3Rx90VCGugFhFJEiQ+7mQoSBT0AInUlUhP93LnAaSTqZnAEQXHBxOxD+mM31XbxMvjkoOalDXjJFoGhgt4xUFiJ8O8p79kagoOXh70CKWo6YtykU6v4Woa65a6uqSYgviz3zN306k8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS8L66iE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS8L66iE"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A28E41F000E9;
	Mon,  3 Aug 2026 14:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766326;
	bh=WIUELnu4B+vHJIHQQEaYEGi2+APaGi8OBF0X5AF1Xd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kS8L66iEc0IxxY2sPHwQ/SNCK8+3dNwvCUvpu46jldCQIiy/wqTmvG8ulBdV//SjV
	 5+bW150ViLVOc304OvrXV0Pa1/uhp9K6r5v+mMGvngYuum4RwUICUKWQyUm7y+HeEv
	 WNZStffJhHLmJZL3hMp0SZ1qAyvqhTR7TIRuGmV4WZNZjQKJU4C/x/mHak7yeLJyn+
	 2B5sq0tj9vyCie24m61SkU0ohPk6B/RI8XoiQsoOLjonjrS1zr1rdADJ35Fqx8pMRo
	 gnIQqFQUEvxralqO1NBx4htsdS2uoFZ03BaT3YfA0Nk9JEDlONWBNdBTTr8BUhDsr5
	 fMcL/bRz10o1Q==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Juan Yescas <jyescas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] kbuild: link-vmlinux.sh: more reliable 3rd pass linking
Date: Mon,  3 Aug 2026 16:11:48 +0200
Message-ID: <178576605143.3450455.8523568280108508915.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
References: <20260728-linux-kallsyms-fix-v1-0-1a665156c898@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 28 Jul 2026 13:42:38 +0100, André Draszik wrote:
> link-vmlinux.sh currently only uses the file size of
> .tmp_vmlinux?.kallsyms.o to determine if it needs to do a third pass. I
> was hitting a case where file size didn't change, but symbols changed
> sufficiently to still move subsequent symbols in vmlinux to invalidate
> kallsyms.
> 
> In particular kallsyms_names grew by one byte between
> .tmp_vmlinux1.kallsyms.o and .tmp_vmlinux2.kallsyms.o, moving the next
> symbol to the next alignment offset (4 bytes), moving many subsequent
> symbols in the final vmlinux image in turn (until abosrbed by further
> alignment instructions). This failed the final link with:
> 
> [...]

Applied to kbuild tree (kbuild-next-unstable), thanks!

[1/2] kallsyms: add symbol size for kallsyms symbols that can change size
      https://git.kernel.org/kbuild/c/bcd29ffd12f8
[2/2] kbuild: link-vmlinux.sh: improve detection of third pass requirement
      https://git.kernel.org/kbuild/c/3ef272de13d4

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to a kbuild-*-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the main branch (kbuild-next or kbuild-fixes)
in about a week if no issues are found.

Best regards,
-- 
Nicolas

