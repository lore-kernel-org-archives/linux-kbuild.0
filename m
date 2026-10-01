Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BC33A4513;
	Thu,  1 Oct 2026 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867187; cv=none; b=Mgeeokhy5cZCVV0P3j55RIewbW+nGEeO9FxZJMG2vMUGXjUDzCtR2fKGuGVieprSs/zPpMWIT3Sxpt37LCIR/8RRCAeEDgKuDfydHqndCb4UgnFSBShNhiiE7JknLY9otSIz+HHpzORDr+xhR3VGjNNyuTu+ns2appGVs8vYFjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867187; c=relaxed/simple;
	bh=WC5DToNAwuDkSZ3DUESV/uejr3zazobHOeacmQlJuJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBfOpfMB4bxEVQZ51WvyAdecbn3DcagEBnOIZhBepQATY394SmZmMa8ahILW2snHImA2rG/nLbI3E+7nWZvTmGgtTgfL9n6MCXk60BeC+7lAxTxwLIawqRQPz5zhvzmAqDmKXZg44Gho8esLhmp78EDa7IKSQEOCMllycRAJyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfHkhrsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfHkhrsS"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 97E6F1F000FF;
	Thu,  1 Oct 2026 15:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790867186;
	bh=xJUcV/Qd/GMbx19FV6jDy34AUKZXpazdy8hkip3kD58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AfHkhrsSMfL13Z56l8L9RiYTdWwxHkcXP6Kl5FM08A9osT/Tzu4fhy/ZepCH33Va9
	 eEwjTA2xlwBsyuOsnsLFYFSHXLX8rU4GHNlX+XYpdnA/MQwkEWvHHSC+aQOuLFmK9g
	 eIlXWAfj6I1XafXXYqgqUs4Zk5qkOznLXCyiHgoPHUgcUYPYpFngF1hdj6KCWuqGfR
	 g2bnH1RNflmFE0ezDxGAlLaDmNNcaCl84oF/XqZUvvq/zn8VCPW/25hXxad2/JsCaD
	 YpVG8W76qnxxMzjeNg040N0ztdP83kBV2z/Zuwpgf767mg+v6GT5Rzcax6MEvs5YmM
	 fcOVzkPZCMaRQ==
Date: Thu, 1 Oct 2026 17:06:14 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Dmitry Voytik <voytikd@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] scripts/config: honor $KBUILD_OUTPUT by default
Message-ID: <ar525jXEMt3ZecH_@levanger>
Mail-Followup-To: Dmitry Voytik <voytikd@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260927154101.122633-1-voytikd@gmail.com>
 <art6lF6jcHBNHCi3@levanger>
 <CAAX90H1Ma5TkiSSg0CB-Tb__G++h-_P=+kiJbaQ4DtS0c+kVRw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAX90H1Ma5TkiSSg0CB-Tb__G++h-_P=+kiJbaQ4DtS0c+kVRw@mail.gmail.com>

On Tue, Sep 29, 2026 at 09:15:28PM +0200, Dmitry Voytik wrote:
> Hi Nicolas,
> 
> Thank you for taking your time and reviewing the patch.
> 
> On Tue, Sep 29, 2026 at 2:05 PM Nicolas Schier <nsc@kernel.org> wrote:
> >
> > On Sun, Sep 27, 2026 at 05:41:01PM +0200, Dmitry Voytik wrote:
> > > If $KBUILD_OUTPUT is set, use it by default if --file is not passed.
> > >
> > > Fix the issue when the script silently updates a stale .config in
> > > the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> > > to be updated.
> > > The problem can be worked around with --file, but this is easy to miss,
> > > and is inconsistent with how the Makefile and other tools work
> > > (e.g., scripts/diffconfig).
> > >
> > > How to reproduce the issue:
> > >       rm .config
> > >       export KBUILD_OUTPUT=.out
> > >       make defconfig
> > >       ./scripts/config \
> > >              -e CONFIG_UBSAN
> > >       grep: .config: No such file or directory
> > >
> > > Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> > > ---
> > > v3:
> > >  - Added an example in the commit message how to reproduce the issue
> > > v2:
> > >  - Addressed comments by sashiko:
> > >    - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
> > >    - use basename when --refresh is used
> > >    - remove echo which can be misleading when --file is passed
> > > v1:
> > >  - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
> > > ---
> > >  scripts/config | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/config b/scripts/config
> > > index 32428ea909c2..cdee67157fe1 100755
> > > --- a/scripts/config
> > > +++ b/scripts/config
> > > @@ -130,6 +130,10 @@ on_exit() {
> > >  trap on_exit EXIT
> > >
> > >  FN=.config
> > > +if [ -n "${KBUILD_OUTPUT}" ]; then
> > > +     FN=${KBUILD_OUTPUT}/${FN}
> > > +fi
> > > +
> > >  CMDS=()
> > >  while [[ $# -gt 0 ]]; do
> > >       if [ "$1" = "--file" ]; then
> > > @@ -229,7 +233,7 @@ while [ "$1" != "" ] ; do
> > >               ;;
> > >
> > >       --refresh)
> > > -             yes "" | make oldconfig KCONFIG_CONFIG=$FN
> > > +             yes "" | make oldconfig KCONFIG_CONFIG=$(basename $FN)
> >
> > Thanks for attempting to fix the '--refresh' option.  But this way,
> > this may lead to very unexpected behaviour, as it regardlessly modifies
> > the path to the config file, even if it was specified via --file.
> >
> > If --file is given, it should take precedence over any KBUILD_OUTPUT
> > (or KCONFIG_CONFIG) from the environment and not be changed unrequested.
> 
> Thanks. I misunderstood what KBUILD_OUTPUT really means. For some reason,
> I thought it should be a filename and not a full path. The
> documentation entry is a bit vague on it.
> 
> > It would be a tiny bit nicer to just strip the KBUILD_OUTPUT path from
> > FN, e.g. (untested):
> >
> >                 yes "" | make oldconfig KCONFIG_CONFIG="${FN#${KBUILD_OUTPUT}/}"
> >
> > But I am still not feeling happy with that.
> 
> Thanks for the suggestion! So, what I did - I just completely dropped
> the second change hunk, i.e. kept it as is:
>       yes "" | make oldconfig KCONFIG_CONFIG=$FN
> 
> I tested the following three scenarios and it looks like it works as expected:
> 
> make mrproper
> export KBUILD_OUTPUT=.out
> make defconfig
> grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config
> 
> # test basic use case:
> ./scripts/config \
>        -e CONFIG_UBSAN
> grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config
> ./scripts/config -d CONFIG_UBSAN
> 
> # test --refresh picks up correct config file by using $KBUILD_OUTPUT
> ./scripts/config --refresh \
>        -e CONFIG_UBSAN
> grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config
> ./scripts/config -d CONFIG_UBSAN
> 
> # test --file takes precedence over $KBUILD_OUTPUT
> cp .out/.config .my_config
> grep "CONFIG_UBSAN=y" .my_config
> ./scripts/config --file $(pwd)/.my_config --refresh \
>        -e CONFIG_UBSAN
> grep "CONFIG_UBSAN=y" .my_config

This one shows one of the problems with scripts/config: while the script
itself handles relative paths to --file FILE from the current working
directory, a call of Kbuild changes the working directory to
$(KBUILD_OUTOUT) and realtive paths in KCONFIG_CONFIG are resolved from
there.

I don't have a solution in mind, that fits it all.  But I think it's
important to not make things worse (or more unexpected) than before, by
accident.

> If you are fine with the above, I can send v4 with adding the above
> testing steps into the commit message.

yeah, please send a v4 and then let's see what we'll do with it, ok?

Thanks and kind regards,
Nicolas
