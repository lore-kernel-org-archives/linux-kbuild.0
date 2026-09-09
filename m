Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CA6489FDA
	for <linux-kbuild@vger.kernel.org>; Wed,  9 Sep 2026 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991766; cv=pass; b=Nj6Z1TnIp2sqNIqvJ54Kp2MVSGnVEe5iT2qRMx8izJ7iWOC4mam4nfdlbPUrq6YmQff5/nwKaiWRNFjjjk5+2tUtLqLtKUwoErgVKMB0LQndR1XANvtpXg3w/GhuhAra7j08BGDDRvdOwgwol10hwmD+hoQtK5jvh6tJDgUGUFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991766; c=relaxed/simple;
	bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZHHrFMQHuUwlhv7eF7DGji3chg2X0sthmnMDUvz5UxIdQMZKv+roL3ImVBvxyPZgysZg1xbUKbF4Mr8zZOv9HucPsf4TDAXEkEyvLm+ig6w75h/qW/cUWLO1rHFVUT+ovlbwvbErPCqYIYwYXT/0AAsfGmT2BJBZz9Y5dfllb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJnHmHhe; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJnHmHhe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso52327855e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Sep 2026 15:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788991763; cv=none;
        d=google.com; s=arc-20260327;
        b=s4I3ElInLTqfjUiaJaZYuDnrEYrO1Hn4eSwPojP7tXLZeQv3gtJAENTGGiaZTQVa4t
         OA0wEkKk78geZ0S7JApZoU81gpLdktz/5Y9PdypV2JBbJjBurJ7lF+QTsjeFlf4c/9ga
         k4/4MjxId983sBor3V90xfIyxlFspD9xDX3LmeJ+7bukDdgXdvYDEWwvpQTMfQXDklUB
         zSqNY/eJdTDY1PjRNVrg6N7BMIKS2m2e8flT+RpJPkUX1fX7MGMCpNz+RWw6eXAgfKdk
         9EfP36v7Tv++HWQrfVWNGAmZhW7GO44novtxypYtci1Qc8h53rvV02ZJGSV5J3q/Wd1a
         LH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        fh=l2LurjmpVImx6YIx6n0QjzLhxZT41CuybQNWmVqWf80=;
        b=NlUjkynkLD6vbBNkB5GEgcM37QaFRSrd5lQCIu1bz1CH9rfBt+uPIVOHZtAsclC9uh
         8jixm2G6a5P/VHTT7TDsPxp6xNk3Zr3z0A5VxSvZlqQGBpYh+DqJc0Krqd/p3mP3AzfG
         qfiTwxkByky6lDTXf5D40M5aI+xmptzvdGWf8wyxTImguo7pSQyxSU38iHIJ2b0vDnfg
         0FzdAvykZPvoSHdpvXuyaEZk2EepNa5ihvXG18rczwg8qSzpnGWP/PiRLpdIPddttnyc
         9+ChF4d9t2tPLKhATjcYnYyT/I/HFpBGcbk3Jv9ZoxxN9fAoUT4l+mR6e8H35ESc+RDA
         LAIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788991763; x=1789596563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=hJnHmHhe+3Z3B/o1b9i3gNkm/aDnbsezDcQyviqY7dy1zsxKPyI3bYCDtR1pjVAytV
         yhiu4H+vtxVlBhhNE1bQlb6f7a48UllOzIPrYLGGCIAN4VhfSbAXPRCETqRmpiSPDTOv
         rWJDZaqFYHjuluIDtrEYzUPixzXiqxS/D9IuWtdGQYfHep7KfZZ14736P7EXNQpqVW08
         pKn1RBFdnG2451tR/nrEy7dEFMergprk0ekp8fLZLbsiP5bXRvyDoJRneG3y2J37tiN7
         kc+HMdzfao1r9BRM3SH3gaRbanbA8Sf7jUGn/rPWRtaAzSNYEBIxyhaqePlgxLqEmC+C
         bNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991763; x=1789596563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=cyJHQLQ6pYbckflwnyP1K4bU+JqNkUGKbHcQxFyRRqmRzVsrFLDhUVXnpyQmP6tZji
         nZwvuny/3LKqCeZ063EpOsUjLLd1k1D1DhDdVkkYnN2pbGH7UBqd/8NwMpUaO/Yx1V2C
         5hRPkljErjVS2WWDqP9ZeQIlT3iYE5zfYd78PITtZ7kBpdHRWvyyXGcM+dHREP3nGgiK
         6jMg49PGG6Yz46+pOpMwmI9IvucUaRSW5UMOBG+oV/Q7g1CcTIqc7NFqm3zY+ZFARfXN
         wgG8kvd8kxOOvfS9CAMl6Zh058IM152BGLS2GI9/YKBSyPch3A0M/MxmurV9ugrdu2/N
         RRIw==
X-Forwarded-Encrypted: i=1; AKwUvBzvfT+Wsq9xcmXN58P3DroIq1W3SUqLhFFeDZ/nQGF+fQYMkuymxb9zoxtyEXlO/KjyShq5gAehPqB4c3A=@vger.kernel.org
X-Gm-Message-State: AFuF++loK4mzPWR00ObuDDRT6414/idoDeGio6zEsJEAW9WsepeUaynA
	vGzb18MkZa/QsCmpzoIImZtkbI1ulE8A+ODkkBLXkSWw51bXG9+r/9g7i2vcSfzDCygPwgUt/b1
	TAZ4y0EjNSofx+7ccaCzYwsxs9qsgOqkOGElg5yVu
X-Gm-Gg: AYBFou1acjVks6PtRF0VAmBwspNxw/dkoipFJYjXY2GFxg1UxV3wgNU6+fzcMdpiqqE
	Wpcvb+SYimtyH/lpsjNdFe5yEt2h/6RFFO33L5Ml3muOs3drbCgabxfbBAJiP8YnOojMPk1jmUY
	sLPZT6PKke3ruKouz66IDsYy71iPm9pjrMBNcmxyiEkWx85DtVjP0m1EuSZxFvRfRRVY/q2wcSe
	mDFgIUUfPI88LhO3N14BLEaKWv15UmhR/6cE+HXKl+TdRQudF45Qp0wvaJON92tI6KUs7bdWW6w
	RI9gO0HU/Hgg6JMfR95GFFzVlQpP3cX+aiTurPqN27AMBuZDD4UFtmpAsqSDiVF8IiKwYF+axwx
	nM2aoCVBSGvirJ9tofB4+x8kMxUQ+Dz3a2jWow5WyUgWdqb6pfKQ6+AVJcoiChKW8hR7CRCY=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id
 5b1f17b1804b1-49d1f109802mr74781425e9.7.1788991761946; Wed, 09 Sep 2026
 15:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com> <aqFptJRjLZIL-NX7@gremlin>
In-Reply-To: <aqFptJRjLZIL-NX7@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Sep 2026 15:09:10 -0700
X-Gm-Features: AcwNN1VBBOSItlzf2aBfQ1Tsn20Bkz1vl5nUIWxayca3KAiKBTvQ_pPLoFqBSq8
Message-ID: <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:17=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> On Tue, Sep 08, 2026 at 02:06:18PM -0700, Nick Desaulniers wrote:
> > It would be cool if your LLM could generate any visualizations of
> > what's going on during a build? Seeing what's serial vs parallelized
> > in perhaps useful. Particularly when you can compare the before vs
> > after.
>
> Great idea!
>
> I asked it to do exactly that, attached. Came out quite nice and sums it =
up
> nicely :)
>
> It also provided an ASCII version:

unreadable, but the pictures you attached are worth a thousand words.
Particularly exciting are the speed ups to the usual edit+compile+run
loop.

For the blue graph (the top one, first), any idea what that dip in the
middle is? That's always what annoyed me.
--=20
Thanks,
~Nick Desaulniers
