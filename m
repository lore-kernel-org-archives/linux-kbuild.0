Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C02348C7B;
	Tue, 18 Aug 2026 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787082688; cv=none; b=XF618M+Io3AsxyfAHTrT7QpBE7FUxJaoJNWMFiq6Y0J2+avWsEbQC0z4jUzh1jfdG6fat1bOieyIRjLVsUy99Q3m+RbDfrARBp0LJzs0wDHsTc4YepjjrbM5HwQ78Nv2ADv+9ftLCgEx7Q40U4ZLtqmptHqbz6WjCxuSzja3TYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787082688; c=relaxed/simple;
	bh=CdEdbbUxQsy9X4hWbcesezUdNg7uEnKgGLem4OWYZJA=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bIAkWFWa1OkcvyoBcwiE12wVnJvp7CTRh3kO+nJj6outXiMOpf0jOMv/YcVsBqSWSQW+KkXpx6okmtkJFAVei/95UoaDss0Y4UziSRsaN84oeQ6dO4BIEgOfhgsvKc2LymaUKE5qmyyM7RjbZ4FsjVKsi2PbMG4088WAHHurm84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLcXAfBM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLcXAfBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7FC1F000E9;
	Tue, 18 Aug 2026 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787082686;
	bh=cRSVKc5iE5tIgPi/nBd0J9NOHf2bIyeJusbO/l5Biqk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BLcXAfBM2axcxaPqyAsVmnTSVGu8VwJKyWQolueUCVwVXA4eslosdsx480B1mOg0y
	 yYlHgnzYikMu4Lj7Fh0ruKNdCvFrt22jh0/xOVpoGXf1x/sMfLKs6xcWAIprfkQmVd
	 sP67Qw4Ty6DxANDV1bvkWjB/5BoPLv8kMkJ/vkT0MgZ0A1rcwYrhYCHzDTQ0jM8a3M
	 54asxsOqYj0rghJV4rWMYpydvdFcQzdNpeiuaiZb+rIXE+hqldoafieKygDTeTi9tL
	 WayN2qEJs2b6e/H/QeTZVJTupFy65rxqsJYasaLW1TkLx4qlP2WKWY2gqd+qtLrpX3
	 RVhD7hTOq2n7A==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/1] kbuild: record real-prereqs in .cmd files
From: Nathan Chancellor <nathan@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, 
 maximilian.huber@tngtech.com
In-Reply-To: <20260814112134.832243-2-luis.augenstein@tngtech.com>
References: <20260814112134.832243-1-luis.augenstein@tngtech.com>
 <20260814112134.832243-2-luis.augenstein@tngtech.com>
Date: Tue, 18 Aug 2026 12:51:16 -0700
Message-Id: <178708267641.2113250.8208366109143651745.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=nathan@kernel.org;
 h=from:subject:message-id; bh=CdEdbbUxQsy9X4hWbcesezUdNg7uEnKgGLem4OWYZJA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkt23f5XSr9unmBZ0zs61vastcUy+TUl846r13AG+Qv9
 VQle+qGjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjAR5wsM/zMkxd/1b930W2G/
 dZaSourUyll+0WqZqhNZpm11Fp6jaMTIMFNMmakyR3TZs9MKkwT2x+rd1I0waNt55IbitfR8vsu
 qbAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> Record $(real-prereqs), the non-phony prerequisites of the target, in a
> new metadata field:
> 
>     make_prereqs_<target> := <prerequisites>
> 
> Write the field from both cmd_and_savecmd and cmd_and_fixdep.
> 
> Update scripts/make_fit.py to read only savedcmd_* instead of parsing the
> complete .cmd file.
> 
> Ignore make_prereqs_* in KernelSbom.
> 
> Link: https://lore.kernel.org/r/a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com
> Assisted-by: Cursor:GPT-5.6 Sol
> Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
> Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e24..6daa244ba0ef 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -181,6 +181,9 @@ endif
>  # (needed for the shell)
>  make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1)))))
>  
> +# prerequisites to record in .cmd files, excluding those covered in deps_*
> +cmd-prereqs = $(call escsq,$(filter-out $(deps_$@), $(real-prereqs)))

Sashiko has a comment that this produces different results based on a
clean versus incremental build:

  https://sashiko.dev/#/patchset/59032

I can reproduce this with:

  $ make -skj"$(nproc)" ARCH=x86_64 mrproper defconfig lib/oid_registry.o

  $ grep -n oid_registry_data lib/.oid_registry.o.cmd
  3:make_prereqs_lib/oid_registry.o := lib/oid_registry.c lib/oid_registry_data.c
  1111:  lib/oid_registry_data.c \

  $ touch lib/oid_registry.c

  $ make -skj"$(nproc)" ARCH=x86_64 lib/oid_registry.o

  $ grep -n oid_registry_data lib/.oid_registry.o.cmd
  1111:  lib/oid_registry_data.c \

As this is just metadata for external tools (i.e., it does not get
consumed by Kbuild again), we could just require them to filter
duplicates after the fact?

-- 
Cheers,
Nathan

