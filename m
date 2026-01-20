Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7044418DB;
	Tue, 20 Jan 2026 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768934156; cv=none; b=f6JcUQT4ZrII4mYk4TyNJNSDC5pSRFn95562JDlBXajJ4572DEWjw4x1PBrp1LWcGX5WjCXRw8EekMIlSEAl7fXV79POYKOnh9YdOgcHF5Fwk86qXSDyTODzRy1y/LYWaki1A5SlEJtRbaP8Swqh2ghSuVTYzP/elqvCtZgS7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768934156; c=relaxed/simple;
	bh=uPhqcdn/h2uLSwiRBkeUsYCovXCrymUWKEUIgjSIHaM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfQoI5Rd8aCd3MrV7p7zIk6FMmW2dY57y8Tv0G5wO261LN9CMrLKR3rG5ratDPnOibPOJ7zOy3REBYA+c8xohAK2Huxq2RNOTam/D7axYtG2DCrPAAlooGw9ZTYAVQf2JGrnvseaTmXZCuVgvdoHK+wvOb2T29wVVVC2ILJwwj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMGIyZ1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMGIyZ1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B891C16AAE;
	Tue, 20 Jan 2026 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768934155;
	bh=uPhqcdn/h2uLSwiRBkeUsYCovXCrymUWKEUIgjSIHaM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=GMGIyZ1WAvGp8d78MBU0OL6EOTD6keexZREwXvxl8bshu7ryOQt+D0LLQjZYEP1Yk
	 XedAP1jtgchKtTX7+kLeDQpshHFon0wL/pKNMnntgYq+d0WSc214UTye4KXjw/mI+Y
	 34Mc7qwisb5JfkfW4FzvWIzNN5/LlG/QyrhznqJWLRJ0ELUckFerTuUUdTJ2KStirb
	 oH0jb62DMKqEWUR1PkKbEjpLDFGuOF7Ywx0XjqdwGEHIOvxkZZk+Xl5HgWSQ4FAGp8
	 WCQxujBPnDgNoxfObbATYSavjxvMr2jbqNaMKoGZOUkOitz3BOvk6zxVGO1K028VdM
	 Soj5yA9epVlxg==
Date: Tue, 20 Jan 2026 11:35:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>, Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/2] Documentation: dev-tools: add container.rst page
Message-ID: <20260120183550.GD2749368@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <c859f9b6dd5313136f7a445497d6209405eafa7e.1767199119.git.gtucker@gtucker.io>
 <aW-I3fNqp_7X0oeg@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW-I3fNqp_7X0oeg@derry.ads.avm.de>

On Tue, Jan 20, 2026 at 02:53:33PM +0100, Nicolas Schier wrote:
> I probably have just read it over: I have to prefix the
> 'tuxmake/korg-clang' by 'docker.io/'.  Is that a problem of my system
> configuration (Debian forky, no special podman config)?

Some distributions ship registries.conf [1] to allow unqualified image
names but I do not think Debian does. Personally, I use the full name
regardless but it should be easy to create it for commands such as these
to work. I use:

unqualified-search-registries = ['docker.io', 'ghcr.io', 'quay.io']

[1]: https://podman.io/docs/installation#registriesconf

> I tested a tiny bit with podman as runtime backend.  If I leave out the
> '-r podman' podman's docker emulation is in effect and fails with:
> 
>     $ scripts/container -i docker.io/tuxmake/korg-clang -- make LLVM=1 -j8 olddefconfig
>     Emulate Docker CLI using podman. Create /etc/containers/nodocker to quiet msg.
>     mkdir: cannot create directory '.tmp_15': Permission denied
>     mkdir: cannot create directory '.tmp_19': Permission denied
>     mkdir: cannot create directory '.tmp_22': Permission denied
>     mkdir: cannot create directory '.tmp_25': Permission denied
>     mkdir: cannot create directory '.tmp_28': Permission denied
>     mkdir: cannot create directory '.tmp_31': Permission denied
>       HOSTCC  scripts/basic/fixdep
>     error: error opening 'scripts/basic/.fixdep.d': Permission denied
>     1 error generated.
>     make[2]: *** [scripts/Makefile.host:114: scripts/basic/fixdep] Error 1
>     make[1]: *** [/src/Makefile:655: scripts_basic] Error 2
>     make: *** [Makefile:248: __sub-make] Error 2
>     [exit code 2]
> 
> But with '-r podman' it works like a charm.
> 
> Would it make sense to switch the default runtime to podman to
> prevent non-functional podman-docker emulation?  (Or is this just a
> problem on my machine?)

Yeah, I think it would be better to prefer podman over docker if both
existed on the system. Something like this should do that?

diff --git a/scripts/container b/scripts/container
index dbe92630f05b..50c4ae851001 100755
--- a/scripts/container
+++ b/scripts/container
@@ -105,7 +105,7 @@ class PodmanRuntime(CommonRuntime):
 class Runtimes:
     """List of all supported runtimes"""
 
-    runtimes = [DockerRuntime, PodmanRuntime]
+    runtimes = [PodmanRuntime, DockerRuntime]
 
     @classmethod
     def get_names(cls):
