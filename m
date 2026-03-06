Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955D52BEC27
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815180; cv=none; b=aybQL9GEaB3jSu79fLCT1++5JA2pZibz+Nll+Q2WCzgc4Bygwh37gSZfYTvHbvPH7DFuJMd4jCnFCjT1NcgrfboYOFu4bjyvM0PyvykT/Ia26dYbsxtRYZ9BLXF3bVYJBGgL9V5ViU71/GEiUIBeESShvYEKvxJdvHrEmeJLBDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815180; c=relaxed/simple;
	bh=+AqAI8FJayhU/Ln5ijql6TqDjro58Xxy3gyRBIeozwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfXpo70klGZ2A7K5OTMLRr1pyBshYX3lzerkV+AXIppy7Z77vTr46EqWm3R9lbtkGoQ5lN0IwRaPeEE0Qo/ZXDgslrydm6LOsaHdOojiuHuIeUXL6+LHefudw3CercLXXiqBbEU8ggv8KCVZUEQw8Im+9yKAHsF0L4yARY2l0R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=oesPfhJq; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="oesPfhJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772815170;
	bh=+AqAI8FJayhU/Ln5ijql6TqDjro58Xxy3gyRBIeozwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oesPfhJqxYK+zYy+KuRqXR21VqcHCE1JjrgEEnTYcVYTwbp/2cmziX34RYB1S7Yc0
	 O36gu4RwW+pyXoWY7Es1RjS8OFxBqE6KwKPQa27Ho6Pd0KYLnQ9Ah1tWc7alk/jjBo
	 2Cez8sxxT6eaRYIeE6Oc34vN1zI2dzxlEUVbIAu8=
Date: Fri, 6 Mar 2026 17:39:30 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Dodji Seketeli <dodji@seketeli.org>, John Moon <john@jmoon.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, libabigail@sourceware.org
Subject: Re: [PATCH 3/3] check-uapi: use dummy libc includes
Message-ID: <6a93d709-2d69-4cd5-9854-18910fa69af2@t-8ch.de>
References: <20260306163309.2015837-1-arnd@kernel.org>
 <20260306163309.2015837-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306163309.2015837-4-arnd@kernel.org>

On 2026-03-06 17:33:09+0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Based on Thomas Weißschuh's series to kernel headers to no longer require
> an installed libc when build testing the uapi headers, the same can now
> be done for the scripts/check-uapi.sh script.
> 
> The only required change here is to add the  usr/dummy-include include
> path.
> 
> Link: https://lore.kernel.org/lkml/20260227-kbuild-uapi-libc-v1-0-c17de0d19776@weissschuh.net/ [1]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  scripts/check-uapi.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/check-uapi.sh b/scripts/check-uapi.sh
> index e4d120eb09e3..c8beec58871c 100755
> --- a/scripts/check-uapi.sh
> +++ b/scripts/check-uapi.sh
> @@ -191,6 +191,7 @@ do_compile() {
>  		  -fno-eliminate-unused-debug-types \
>  		  -g \
>  		  "-I${inc_dir}" \
> +		  "-Iusr/dummy-include" \

What about also using -nostdinc?

>  		  -include "$header" \
>  		  -
>  }

I have a similar (unfinished) patch flying around which also
uses usr/dummy-include from the different kernel versions
to avoid mismatches in case something gets removed there.
Not sure if it is worth it.


diff --git a/scripts/check-uapi.sh b/scripts/check-uapi.sh
index 955581735cb3..48d157ee5408 100755
--- a/scripts/check-uapi.sh
+++ b/scripts/check-uapi.sh
@@ -186,7 +186,9 @@ do_compile() {
                  -std=c90 \
                  -fno-eliminate-unused-debug-types \
                  -g \
+                 -nostdinc \
                  "-I${inc_dir}" \
+                 "-I${inc_dir}/../dummy-include" \
                  -include "$header" \
                  -
 }
@@ -197,6 +199,7 @@ run_make_headers_install() {
        local -r install_dir="$(get_header_tree "$ref")"
        make -j "$MAX_THREADS" ARCH="$ARCH" INSTALL_HDR_PATH="$install_dir" \
                headers_install > /dev/null
+       rsync -a usr/dummy-include/ "$install_dir"/dummy-include/
 }

 # Install headers for both git refs
