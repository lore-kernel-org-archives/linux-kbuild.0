Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F792F8E83;
	Thu, 28 May 2026 20:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000838; cv=none; b=MFFknLQx2IhzxPKQ/7S5bN24ksXhArUOHtGe3GP+ncZsxTu8unTPxQhlelQq4Rh8oysj3qzm2MP+UegHr3UqArdEdW/C3coNWDq9dHChkUiUKNYSrdVuaiiWIxMmN8+2SBqqT2GGhDrgvqcD7Ph6mXP+Cm7iuWpl0+3iS9yKLuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000838; c=relaxed/simple;
	bh=BDg/oJHQQ8uhe2QKp9Z25c/KlTknzhAYgHQXliY+2j0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvTANDGZHeUi5kwcUWtRabkZRZgqEHLP1tYz39gKgk9ctxozSzoA9G1Exg9+ubspEU29FZP8Su3oa5byKZILAvibwI9M+2SHcPgott5iTxCulrhQcwvTTb0qYKPYDT3Xe+7mvwO5Wt7GCyS6rOX3C2C75czgVM5z7pySwvhKiXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eH8spSlm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eH8spSlm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493E71F000E9;
	Thu, 28 May 2026 20:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000836;
	bh=NbyQeATPiARrU3/yjISmSaIZOFq9qrw/SnRM3Vxvz+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eH8spSlmM1ZydivrZWuTVSNYgFcwAMN0OpZaWf1BG1KOcjnOxE/Jxk1rIAmVjHwtH
	 DlQ7GfTKr3aG//Bqv0lHYkTXppCFqTY06R31BxLWbbPv0gTzudQ/P1Pown6j2K2wZa
	 MSyEhx4CizwInFtLs/dNgiod0z9/m6ABMMJH7qrACmaZyj9V067uR7SyJliju+3h/e
	 7ty70tdBbaixdigylIOSA8mASoH+7M4kkbMR8wN/yvUNUxLjva/nwzZ05004SDTYiu
	 e5OPaYibCozj9iDVOV7F0RbMaU1igfSzLmDkAcXGi4SLAI+Zz/SeEBZFCisKed2Cff
	 LUUyrx5AFoFng==
Date: Thu, 28 May 2026 13:40:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 3/3] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <20260528204029.GC3100532@ax162>
References: <20260526172926.2717929-1-xur@google.com>
 <20260526172926.2717929-4-xur@google.com>
 <177992962862.1361033.11249653355160017674.b4-review@b4>
 <CAF1bQ=Syrnb-wEfXmHpcDg3u7JVXQnDExhjWFzDAzA3paZD7mQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=Syrnb-wEfXmHpcDg3u7JVXQnDExhjWFzDAzA3paZD7mQ@mail.gmail.com>

On Thu, May 28, 2026 at 12:04:59PM -0700, Rong Xu wrote:
> On Wed, May 27, 2026 at 5:54 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Tue, 26 May 2026 10:29:26 -0700, xur@google.com <xur@google.com> wrote:
> > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > index 0718e39cedda..b36c7c6817bd 100644
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -249,6 +249,12 @@ ifdef CONFIG_LTO_CLANG
> > >  cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
> > >  endif
> > >
> > > +ifdef CONFIG_LTO_CLANG_THIN_DIST
> > > +# Save the _c_flags, sliently.
> > > +quiet_cmd_save_c_flags =
> > > +      cmd_save_c_flags = printf '\n%s\n' 'saved_c_flags_$@ := $(call escsq,$(_c_flags))' >> $(dot-target).cmd
> >
> > Sashiko notes that we might want modkern_cflags here as well, which
> > seems like it could really matter for LoongArch?
> >
> >   https://sashiko.dev/#/patchset/25040?part=3
> >
> This is a valid point, as users have the ability to add new flags via
> KBUILD_KERNL_FLAGS and they are likely needed to pass the backend. I
> will update saved_c_flags to include modkern_cflags.
> 
> > The other comments might be relevant too but I did not look too closely
> > as I am wrapping up my day but I wanted to bring this to your attention
> > sooner rather than later.
> 
> The second comment concerns using a shell script to get _c_flags: I
> opted for this method instead of $(saved_c_flags_$(<) to avoid loading
> $(<).cmd in the Makefile. Note that I only load $(@).cmd at the end of
> the file. However, if we would rather use the latter approach, I can
> make that change, though it will require loading $(<).cmd file.

Yeah, I think it is fine to leave it this way for now. If someone can
prove it matters for a significant amount of performance, we can
revisit.

> The third comment concerns file name matching: That is a fair point; I
> should have implemented a more precise matching criteria. I will
> address and fix this.
> 
> I disagree with some of the comments regarding compile times. We have
> tested this build mode extensively and observed no compile-time
> regressions compared to the existing in-process ThinLTO build.

Yeah, I tend to agree that the performance concerns are overblown.

> I will send the updated patch shortly, after I tested the changes.

Thanks!

-- 
Cheers,
Nathan
