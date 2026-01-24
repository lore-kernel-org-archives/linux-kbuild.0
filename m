Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664FB1C01;
	Sat, 24 Jan 2026 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769240853; cv=none; b=PrA3glPhFSL2s88KCq7sdlcZLM6eRgBEBy7c9akIq04kIG4wwbTNv3PAdDRnpGzR69KNpnp9iQw2lrDFeh9Xre2fEWDJoQHHU88mLmsOEUSAMHqmez0FNXzPU1CDDpkiJMNHpHULf1uUFH+fGRkTp3AvWUKhwam69seQbB3fJf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769240853; c=relaxed/simple;
	bh=cRhYEqASoyGXvv4wFRlJyoAFgB1wB4v+V+7SwqQAphE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ikSU5YmnbZVcecfzPeGREI4not891gITzWYZTAhmT3PCPVXGbyDujvxdHFqb0Ztvx57TyFHpLeNPuIXpnMvjzzFOZ3rxxHwILHpTAoimhszROKwxsO62Sz8fJSRj4/8aeQkeqkVPP/OsH8gDfVdjoRGvTn7sTQEy0zRZL8AmY2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ0RtR6l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJ0RtR6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79FAC116D0;
	Sat, 24 Jan 2026 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769240852;
	bh=cRhYEqASoyGXvv4wFRlJyoAFgB1wB4v+V+7SwqQAphE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PJ0RtR6lxginyXgC/wWOq1PMCQqJtrBUuSSzp/J8zAW+hMSaBttoj7el3UIRvGwOn
	 JJNrpOxF6gaqtNWer9O66JBK+EXrzLJR04mmKvqrTJoM+B6Eprwh3m60XamLfuGHOx
	 Ygi2e7mYPlEuCYGL/Z9sD4dBSbsgzPn2e3ywqABJJ0J86BGWJMFlEmLS98lqG/wFl+
	 8Lfo5dkLTfZ7JGgkXtYMhbVTsUazD/bqi6Qfd4nA1e+pxvFUNL9hPd36fkj7qzy3BL
	 ChEdKHzDghh82z0477fb9eQjqGOFMlqrgzQkF/H3fZ3qW/tlcMB27o3iDPY/6goisr
	 NXIu0menLU07A==
Date: Sat, 24 Jan 2026 00:47:26 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
    Gary Guo <gary@garyguo.net>, 
    =?ISO-8859-15?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
    Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
    Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
    Danilo Krummrich <dakr@kernel.org>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>, 
    Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>, 
    Vivian Wang <wangruikang@iscas.ac.cn>, 
    Jason Montleon <jmontleo@redhat.com>, linux-kbuild@vger.kernel.org, 
    linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
    llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
In-Reply-To: <1b0943c4-b1c5-460a-8944-c8d9c868b085@isrc.iscas.ac.cn>
Message-ID: <47d1dab9-a379-7b3a-d06c-03d674cfbb76@kernel.org>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn> <1b0943c4-b1c5-460a-8944-c8d9c868b085@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Asuna,

On Thu, 22 Jan 2026, Asuna Yang wrote:

> Gently ping. I think this patch is ready for review. Is there anything else I
> need to do before merging?

I guess this should probably go in via the arch/riscv tree?  If you agree, 
then from a maintenance point of view, it would be good to get some acks 
for the first and third patches from the relevant maintainers.


thanks,

- Paul
