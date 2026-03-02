Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121E423158
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Mar 2026 17:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471403; cv=none; b=EFhydTiGFb0IN3NyhluOy128leJWYVUMSNkkT3Sgq/m1YujiRe9/OO2jX6ZWvxSzW/QlPvHRFqPEl5mf4HVsFgSj169c15PZqnqaOMxOuxKRYv0Tj1sRZaCFJ/ijEEpQsGyh0u0rOYITPZDhTKp1oWHZpMz2Q9SsMs2ORmROZsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471403; c=relaxed/simple;
	bh=MipzM9l8rcuJPMudzIX9Tri9lqeqfZzofMtVjElxF+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrkwovdWalbrLVGYioP9BFV6W02hksuAXQ6sujQVVJTVuQiV417mMnp4AwS2de2BJa7iWO8ehYTUjRkKxUlCW0sjuqJdX9UuZyDNYyCnY4X8etYamlz/TEu3cVhzXXpkH/l2nKxNkBy/014QE5dwV746UJuuHtiKWX/RfFca/jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CxRPYjqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CxRPYjqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD21C19423
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Mar 2026 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772471402;
	bh=MipzM9l8rcuJPMudzIX9Tri9lqeqfZzofMtVjElxF+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CxRPYjqi4Qd3BKX1e+5gfBFZFyUSjeIN9nvQu8etrwgDCF4tZrnt6Nuc9VhzIz5iE
	 cXq5ZAHARHxAIyRwef9CCx8kUa2gO+bNF9CNbe0M7t0UEHHTj2JM5MgAJLGwkBJXCS
	 94goggU85kPQ+zchkTgO695ZLlTg5gLTMGCzB7BbnDVYaRTvY65jReMyBJRr8lmnEK
	 ghS1zhv6qdhPSoSNDvk+r28LDY+P9SHHfG/epcLsZgOboAg8h3u2c5eTSJ9PTMTJqT
	 3X4Iyuv1x3ijy60QVnt/+wD3eL0m2qMIl/iIbdpD5nFW/Sl+hRlvBs3nSRTH+6mLgg
	 /vhL+Q7Ry8J3w==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-389f9e70ae6so77471441fa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Mar 2026 09:10:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/qnFOZv1oIWla8AMKLdK8LjgdWiF0+IAFjNYg3B8mu5DiHrg1EsgOJZP1C2Z88F5y/VGgA3ZmoEMmwWA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7oI70AN68UaZ1vQH5J3nnHCfy6CYcxZWeWpr1YhAOzIAUb6cv
	iS1HeGT5DiDKo1QZBaGFOgdDFCkaxxzwuJz2O5ifC6aRYU5NXui0jYPBezm/i7LNspSuWfCig2b
	zc86EdCofHLiTNkz/xbI8nj6Rz47pW0E=
X-Received: by 2002:a2e:b4b9:0:b0:385:f235:51c5 with SMTP id
 38308e7fff4ca-389ff36c891mr67907321fa.35.1772471401238; Mon, 02 Mar 2026
 09:10:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-1-829e4e92818c@nvidia.com>
 <CAJ-ks9nhmTbGS0aeFkFnHLB=u_3g6A2qgpFhZu6E4oXrhP9U2A@mail.gmail.com>
In-Reply-To: <CAJ-ks9nhmTbGS0aeFkFnHLB=u_3g6A2qgpFhZu6E4oXrhP9U2A@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 2 Mar 2026 12:09:25 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9msSrBcQ9dHxc0Ke_-40ohfgpSWE0Y8sxgSy7=AjyKsWg@mail.gmail.com>
X-Gm-Features: AaiRm51MJF4H5ii8TR58ty9eY_F3IHcaQ7YeCogMhNBgTTNq-HspB-NofV4nQ0k
Message-ID: <CAJ-ks9msSrBcQ9dHxc0Ke_-40ohfgpSWE0Y8sxgSy7=AjyKsWg@mail.gmail.com>
Subject: Re: [PATCH 1/6] scripts: generate_rust_analyzer: rename cfg to generated_cfg
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 10:28=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> On Tue, Jan 20, 2026 at 3:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.=
com> wrote:
> >
> > This variable is for the cfg from generated files. It's also easy to
> > confuse with the `cfg` parameter in append_crate(), so rename it.
> >
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> I have the same change sitting around locally.
>
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
>
>
> > ---
> >  scripts/generate_rust_analyzer.py | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 3b645da90092..c188d1f1fd5b 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -21,12 +21,12 @@ def args_crates_cfgs(cfgs):
> >
> >  def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs,=
 core_edition):
> >      # Generate the configuration list.
> > -    cfg =3D []
> > +    generated_cfg =3D []
> >      with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
> >          for line in fd:
> >              line =3D line.replace("--cfg=3D", "")
> >              line =3D line.replace("\n", "")
> > -            cfg.append(line)
> > +            generated_cfg.append(line)
> >
> >      # Now fill the crates list -- dependencies need to come first.
> >      #
> > @@ -173,7 +173,7 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
> >              display_name,
> >              srctree / "rust"/ display_name / "lib.rs",
> >              deps,
> > -            cfg=3Dcfg,
> > +            cfg=3Dgenerated_cfg,
> >          )
> >          crates[-1]["env"]["OBJTREE"] =3D str(objtree.resolve(True))
> >          crates[-1]["source"] =3D {
> > @@ -215,7 +215,7 @@ def generate_crates(srctree, objtree, sysroot_src, =
external_src, cfgs, core_edit
> >                  name,
> >                  path,
> >                  ["core", "kernel"],
> > -                cfg=3Dcfg,
> > +                cfg=3Dgenerated_cfg,
> >              )
> >
> >      return crates
> >
> > --
> > 2.52.0
> >
> >

Applied to `rust-analyzer-next` (just this patch). Thanks!

  [ Changed title to include script extension. - Tamir ]
