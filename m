Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB94734389F;
	Thu, 28 May 2026 00:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779929641; cv=none; b=s81fUn9lQtAhoaUAymeWrXEsjlVrBrueX8x9HW9fMGJOONc8rAMLkD55AOeabbzNnQ71jjcmqZU+UI63uS2k0Jc1YpplfxEbl+QGOKGEDvBQwaJ69wlHST6VfT3zmbzztDuSXOqAm4ICCnwVb1L0ncIV1uJaMzO3wYgPm+ayQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779929641; c=relaxed/simple;
	bh=7OieC3j4bhoQbAcyiuNCBDiS2VUTkSjW62BflYGByCc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KjWwaivOfLBqoK7qCHMFXbLvxLCNUEIUSegtlPm8mib7wLzhm4OxZ/3YUdcAQ8lNBkO40FNJAuyAALrNcmDZj6Smzr7UX4fcW9vWz4nkfNNpUP7N/9DQ0vsPO5epV1BRspCfdhdn3YM1zMVTu2BY9IUHodI5+BoPefGc56GsBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyMy4vBn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyMy4vBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701321F000E9;
	Thu, 28 May 2026 00:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779929639;
	bh=pdDjIkNijKLPqQZZjvl89rVWZJDBbIPWDE3n8/9bQ/U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cyMy4vBn+6CqelyL/RfAXqBmOY+xqIsWgJ5euNlyQbxOWpyZE7sFT6RkYNdPtHaYr
	 rFVWSessbHo/uJIV2IvLs2xMDPbS0andOm4ed7iwzoVYECyh0WqTiJeu7Exwo2iio9
	 kjerszR3XwJ14ozmGVvWhG4pNUGuZTXwFB719S9qCmwlFct5VzOc5GqDHipCxDuQSG
	 PrgRUycJTsJxermakUvRH4H3otYT+JClQx+mPOsmndezmFfNqoeG9h8M851ra2a/5i
	 7Hn3jwJgeV91PEJnUt3kRlJM/6oM1f7tAdqjhDmPs3jRKKMFWZN5pUgaOHiJoIir8T
	 /L4a0ug0BSpUQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 3/3] kbuild: distributed build support for Clang
 ThinLTO
From: Nathan Chancellor <nathan@kernel.org>
To: xur@google.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Yonghong Song <yonghong.song@linux.dev>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Stafford Horne <shorne@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Piotr Gorski <piotrgorski@cachyos.org>, 
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
 Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20260526172926.2717929-4-xur@google.com>
References: <20260526172926.2717929-1-xur@google.com>
 <20260526172926.2717929-4-xur@google.com>
Date: Wed, 27 May 2026 17:53:48 -0700
Message-Id: <177992962862.1361033.11249653355160017674.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1013; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7OieC3j4bhoQbAcyiuNCBDiS2VUTkSjW62BflYGByCc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFnik5T15riviJu1iXvf3eyNNgYaT89zO9wWOPXX/8D9b
 ubU/b7MHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi9QIMfzjurRH43/6pVj5z
 /enrN/k9tvX0ubIxGC0JPHjhb/yUq5cZGaa0C+xd2dadtNmMbeqNGdOmu1/meui/UL88y2jN8f9
 /ZjADAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Tue, 26 May 2026 10:29:26 -0700, xur@google.com <xur@google.com> wrote:
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0718e39cedda..b36c7c6817bd 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -249,6 +249,12 @@ ifdef CONFIG_LTO_CLANG
>  cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
>  endif
>  
> +ifdef CONFIG_LTO_CLANG_THIN_DIST
> +# Save the _c_flags, sliently.
> +quiet_cmd_save_c_flags =
> +      cmd_save_c_flags = printf '\n%s\n' 'saved_c_flags_$@ := $(call escsq,$(_c_flags))' >> $(dot-target).cmd

Sashiko notes that we might want modkern_cflags here as well, which
seems like it could really matter for LoongArch?

  https://sashiko.dev/#/patchset/25040?part=3

The other comments might be relevant too but I did not look too closely
as I am wrapping up my day but I wanted to bring this to your attention
sooner rather than later.

-- 
Cheers,
Nathan

