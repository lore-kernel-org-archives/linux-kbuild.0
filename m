Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765F6492E2F
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053419; cv=none; b=NZ1KxKMwHwOOsd1zpdTQIc3iQmhJ86pQuXpvOm5vcLdA9dxkJM0IxlqMrbpruTE+FkantUvIO5Z930g9qamFVYujpLLTtTbi8gVSThEdKVvuOryKwO3dYbTfjQVn7REg2tckke4D3RJs9NmDZ3P2nveK0nSOo+YH1gcZwyoCkFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053419; c=relaxed/simple;
	bh=Y5+rPPnQJMdd74pjMOwMoO4VV3bktNkkdMQDKm2tcy0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=YQfJFDEXFKE2F/XVbi3ZGLqPdQY254VzwULfDc5aI3qrltdCcaghTwuwhG0vPF+b+7BTgK0MguWKe8iZB3sH0/PkGZmAZ4jBXROF7h02YhjfC9Tex38BUGZKPZq/0d/d42EAbLo0Hxw+APizA0XlP0k2t1nJWo/SOsT5fINnfWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNHE14Ef; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNHE14Ef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1DE71F000C4;
	Thu, 15 Oct 2026 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792053418;
	bh=iZJ7W4PvnvwEFKCJo3Bi5HBP9ELP734LzQP7X5/mJsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TNHE14EfC8HKkmu1q3SzcFfmjOa8CWbJFEh6NwOQBiA6BIilPtrppPEfifPD+bEEr
	 qLKfgpSaAtCxZMJ047Mb4hFflSEHX1IQtpA72BH198PM5BqsIkH6uuBp/KOz2kGnkH
	 hvJdziOwmOBiwObgLmUe2LB3mZDUJLrT5W8QwY4ql0i7Xz2NtYJ51A0q1fNJeQBM3S
	 wgr/KuhrMsLwPAz+P8IpTiZvAYnpSbtlUeLdw3H0EMASyRSV+hau2olDgJDYe/2M2D
	 55I2ZYZ+5+h143GLypheMvql2SBsxJFyhGIWhnaPJLt4X5WM8MfLRjSEof7f/9kc45
	 yCSOWlKVxRQ0Q==
Message-ID: <sashiko-outbox-172504@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] kbuild: enable pipefail for commands where possible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <thomas.weissschuh@linutronix.de>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, "Nam Cao" <namcao@linutronix.de>, "kernel
 test robot" <lkp@intel.com>
In-Reply-To: <20261014-kbuild-error-propagation-v1-1-573adaa0a076@linutronix.de>
References: <20261014-kbuild-error-propagation-v1-1-573adaa0a076@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:36:57 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] kbuild: global pipefail breaks early-exit grep -q pipelines
- [Medium] kbuild: try-pipefail redirection fails to silence errors on unsu=
pported shells
--

commit 144ca777192e6140faa2332a17fb19531eec93bd
Author: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

kbuild: enable pipefail for commands where possible

Enables the shell pipefail option for Kbuild commands where supported, so
that failures of earlier commands in a pipeline are not silently ignored.

Link: https://lore.kernel.org/oe-kbuild-all/202610131613.BpOi6VPp-lkp@intel=
.com/

> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e246..1975d2739cdb0 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -149,8 +149,11 @@ delete-on-interrupt =3D \
>  		$(foreach sig, HUP INT QUIT TERM PIPE, \
>  			trap 'rm -f $@; trap - $(sig); kill -s $(sig) $$$$' $(sig);))
> =20
> +# try to enable pipefail
> +try-pipefail =3D set -o pipefail || true 2>/dev/null

[Severity: Medium]
In POSIX shell grammar, the || operator separates simple commands, meaning
the 2>/dev/null redirection applies exclusively to the true command, not
the set command.

Will this cause build log pollution with 'Illegal option' errors for almost
every compiled file on systems where the shell lacks pipefail support (such
as older versions of dash or minimal busybox ash)?

>  # print and execute commands
> -cmd =3D @$(if $(cmd_$(1)),set -e; $($(quiet)log_print) $(delete-on-inter=
rupt) $(cmd_$(1)),:)
> +cmd =3D @$(if $(cmd_$(1)),$(try-pipefail); set -e; $($(quiet)log_print) =
$(delete-on-interrupt) $(cmd_$(1)),:)

[Severity: High]
Kbuild relies on shell conditionals using pipelines that terminate early,
such as the module symbol version generation in scripts/Makefile.build:

if $(NM) $@ 2>/dev/null | grep -q ' __export_symbol_'; then

When grep -q finds a match, it immediately closes its standard input and
exits with 0, causing the upstream command to receive SIGPIPE and exit
with a non-zero status.

With set -o pipefail injected globally into cmd, the pipeline will evaluate
to the non-zero status of the upstream command (e.g., 141), causing the
condition to evaluate to false.

Does this silently disable critical build-time validation and logic, such
as module symbol versioning or vDSO dynamic relocation checks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-kbuild-err=
or-propagation-v1-1-573adaa0a076@linutronix.de?part=3D1
