Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2434825CD;
	Tue, 15 Sep 2026 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470002; cv=none; b=VcVmrnX4WA8sS2+a2eSei7E0NenlTzjmBldLkT0O7oLU5r+VMMmPcEbY7eLNKdFVtWuLbOG3WC4xiYTw9549QwybDlYjpbzS1wTuAT5OaYyOcEgqytX6lx4GhILZpcHeK7b6rcCcDE8gn3WfKPm3op5lXZmcqdKjA3UOMzskCzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470002; c=relaxed/simple;
	bh=JNR5zfCVtYBrdrrE/pVMGZIaedTXT79SXKmrlaG9k/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhfMbo9M/cRt4KVdL5Y8j2FSvoDdbXK/cAWOa6SlImjjmoezwRp68W28Y2GXZ4n2sQ1fZPKWxHtNi8aeDfsoHJolM/9fX8gHCrGwF3K4emtXeLeVrMEw8jTMIBC0CgCKCyW8AjJslxXpeb8lh4CvRwY7dbUt2J1pwya7uMOFh2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=dE15pMHj; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="dE15pMHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789469981; bh=JNR5zfCVtYBrdrrE/pVMGZIaedTXT79SXKmrlaG9k/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dE15pMHjz+F59R4CCOXmQCaIkfAAOOg/LilpiQS34WOb3erstQbSNIQUGP7GWb39s
	 NNmd6iKc1YStb2cpVERWg8/oUdejrZatQ6p/Qa9Lq5wUx9GsRweeWi2AJsJILiOL9S
	 CCMHK5sJ0UK6LZi+/YutI9T5Bc4bgGXQOtTMzvk2H1/N9J3onKneoJqHa8UHRhplx/
	 1UT1WeaIZsq8oRa4135H8wIRRAtlCnEUJNcRm3eKjVnHW8mNS1LHZT5hPlsdxV+VNX
	 ZIuxMhITo0NqCHxsi9D2xs90iw5LFd6bif0ohYnqUOVVVDAPtyz7DfUkBjvPXUYnu6
	 QY8Kuf7B1dGSA==
Received: from [2001:bf0:244:244::78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aa9251d-0449-7f0000032729-7f000001ce24-1
	for <multiple-recipients>; Tue, 15 Sep 2026 12:59:41 +0200
Received: from mail-auth.fritz.com (unknown [IPv6:2001:bf0:244:244::78])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 15 Sep 2026 12:59:41 +0200 (CEST)
Date: Tue, 15 Sep 2026 12:59:40 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Erkan Erdem <hexvalid@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH v2] docs: kconfig: fix shell function syntax in caveats
Message-ID: <20260915-pastel-industrious-rhino-8bddce@l-nschier-aarch64>
References: <20260907103739.23212-1-hexvalid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907103739.23212-1-hexvalid@gmail.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789469981-23FBD965-20911049/0/0
X-purgate-type: clean
X-purgate-size: 1797
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-01  mail-id: 16A61A02F2  external: no

On Mon, Sep 07, 2026 at 01:37:37PM +0300, Erkan Erdem wrote:
> Kconfig separates a function name from its arguments with a comma, but
> the caveats section uses Make-style whitespace in its shell calls.
> These expressions expand as undefined variables rather than invoking
> the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> example fails to parse.
> 
> Add the missing commas to the shell calls in this section. Keep the
> Make examples unchanged.
> 
> Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> Changes in v2, addressing Julian Braha's review:
> - Remove whitespace after the comma in the three remaining shell calls.
> 
> v1: https://lore.kernel.org/all/20260905124045.42713-1-hexvalid@gmail.com/
> 
> The issue, patch and changelog were prepared with an AI coding assistant.
> The assistant also prepared the v2 revision and ran the checks below.
> 
> Validation:
> - Re-ran the documented working CC_HAS_ENDIAN_FLAG example using the
>   Kconfig conf tool built with Clang on macOS. With a test helper returning
>   y for either endian flag, the original example fails to parse; v2
>   executes both probes and sets CC_HAS_ENDIAN_FLAG=y for both endiannesses.
> - Rebuilt the changed page alone with Sphinx, treating warnings as errors.
> - The complete kernel documentation set and kernel were not built.
> 
>  Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Thanks!  I'll queue it for kbuild-fixes, but it might be defered to v7.4 
if no other build relevant fix will pop-up.

Reviewed-by: Nicolas Schier <n.schier@fritz.com>

-- 
Nicolas
