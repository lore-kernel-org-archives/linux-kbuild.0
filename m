Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7561252F28E;
	Thu,  1 Oct 2026 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866428; cv=none; b=TO2C2e1DJkji5KCvkmxwfXScgB//78mfqTJu4gVUlKPBhQdsXMS1RyNLt+mbNpM5yROtmxgurCUsTqmfxnP3BYyBeeLpXevBB/MNoXLfq0iS0tZ5tb5hzqi8FzC70gO6AzUc8lK9SCymioWm0Mlmtk4CBNrNTLP39Oe1byyLM0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866428; c=relaxed/simple;
	bh=OaIGSMHhS88c60bkhtjrkNjKc4y9HoeCGqVGlYt3+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UD5rCMNIN4Lxqc7vrH+g8/l7Yl5E0Rd5aCWNSAvL6tS2CjVa+axpYI+CH8miJDPU1I40JxJ+cRATAn+q+MxMPXByACo8CmphFONEWDUHRZLW6k4/Jwx1orqVHnX48MHUAR1UaxA4eJs4AP4W1kQm3Fsz/gmOKWUuJ6WRr+lbLh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMBDocGq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMBDocGq"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 937AB1F000FF;
	Thu,  1 Oct 2026 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790866427;
	bh=D8bfEN38HsI68CKghJy2R0ds3eA2NuU2nqaAm1bggiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mMBDocGqE6x+T5w4aDF1xb6ztBk5Hv1bplpPdS/TJZH2n8eSsTJpLqcNoXhnUxDNi
	 RUVgQMJFJXFQXqivnuM/LXyEO5djTB8WiAuX6FYuJabU7GI9TMkQgJZ+K4hMYj6rYK
	 DgvDdK83ZM3+I48vVH2SOouxwxhXYk/dYT5S4djnb2otZhukNxCFqpcqQRYpWhpgRd
	 kruYoTv1s/+pV1iINXN7KnJX5/lkMR+XnsFfquvKb/xnZjtrHImTmKEeWssNX2Okx6
	 uwci4WTN+CqZRX6IkFfX1SfrtQMRnJflxPQxl4dgsbZHLrm+YuWYMXweg2UOS5luuh
	 RNLJHAdYiORRA==
Date: Thu, 1 Oct 2026 14:14:02 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Jan Stancek <jstancek@redhat.com>
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] .gitignore: drop Module.markers
Message-ID: <ar5OilSNmM3uS31E@levanger>
Mail-Followup-To: Jan Stancek <jstancek@redhat.com>, nathan@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <8cbe913b9f80dc6fea73a9e3d51429db2b38905f.1790838401.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cbe913b9f80dc6fea73a9e3d51429db2b38905f.1790838401.git.jstancek@redhat.com>

On Thu, Oct 01, 2026 at 09:11:10AM +0200, Jan Stancek wrote:
> commit fc5377668c3d ("tracing: Remove markers") deleted the marker code
> and the modpost output. Follow-up commit 8723eaeff59a ("Kbuild: clean up
> marker") removed it from clean and mrproper targets. Both are from 2009,
> so the file is hopefully no longer in anyone's tree, drop it from
> .gitignore as well.
> 
> Fixes: 8723eaeff59a ("Kbuild: clean up marker")
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  .gitignore | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 9875120ea7bd..01e6a1f7a49e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -75,7 +75,6 @@ modules.order
>  /vmlinux-gdb.py
>  /vmlinuz
>  /System.map
> -/Module.markers
>  /modules.builtin
>  /modules.builtin.modinfo
>  /modules.builtin.ranges
> -- 
> 2.55.0
> 

Thanks for spotting!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas
