Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355F841F376;
	Fri,  7 Aug 2026 20:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133204; cv=none; b=q5cchysGqmpZMGiLOGYzkj0SiqYiXWKu8sS1W/dTJ8gV6ROqtjBgWmg84EwZDWh8/3KOUKErufV/HTU7k3BWGLJQEpamF3fZiZsB+jX7iOPlh6utxdjqf+Yoytoov/wKEIBFK0iiWFzZhJ7KKNHcKNkmHJdUf+Yn1I3dzPmQKqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133204; c=relaxed/simple;
	bh=AvhU7K12OooOC2zFe14qGuEMZoKYYhX8FEiv1Kml7e4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Yih++ukjRxcXfzjxmeD2EZFrigMvhAs/tQ1OrC2av87095XEp8twoad654j2+5Tee4izOqtA4Yko0l0Oq66b7Eln3lxMiQm3rH07Hk0mnGyfFxCLCOvIshf8hDG2I5CdWfQ2rwdklGkFD4HfgDbvAQ3mZQirmmpNjZDs+d7YOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkBXz61y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkBXz61y"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 61B041F000E9;
	Fri,  7 Aug 2026 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786133200;
	bh=Q7zr4Kfwuib3CpCydRnKIf1Tv86Px7aoNBmpJaDigx4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=lkBXz61ycFbaiLC1JojAStWtlue2Y4HNeffD/mVg0hmlPFcTDIm7qAiRTbOkfwu6j
	 5NxoKhPP2emcFp52J0x/MjMcAN000BGrCY5e7OsZIwyHXl9saWrICBamJH7wHhn4zy
	 KML3sPGca0NXTlaunHB4F+D/CBic8z8GtUwt2eawq3rhNRO1HqoaKTGkzuYgCIizUm
	 8aP1A4y1QFGf2dULIMJN8HFznhGxoAbroeRKzcHZFmYTMRZoiBDAMdPHHttb3VPHfu
	 iCDuxKCVWu4MxnWPiMXfdZZIlqqaPRvhn/QTmm/3QsSqsSplPBaG00JAHmR+nW9Hgg
	 +OYbBWIDhhBRg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/2] modpost: error logging cleanups
From: Nicolas Schier <nsc@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
In-Reply-To: <cover.1786120005.git.jani.nikula@intel.com>
References: <cover.1786120005.git.jani.nikula@intel.com>
Date: Fri, 07 Aug 2026 22:06:13 +0200
Message-Id: <178613317332.4111548.5289716748030449836.b4-review@b4>
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=740; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=AvhU7K12OooOC2zFe14qGuEMZoKYYhX8FEiv1Kml7e4=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqdjq28Kryq8ApwcrHWO/gaJUgXVqmzSyNzxk+p
 3zjmJSuWYqJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCanY6tgAKCRAHUgpwFiYS
 acg0EACdX63WEUbwLEQCxCDVeP8wN2pEeiQARW6MFRDlqz96hZlBbC2sqIm2JFuDkdKqnewkc3t
 Bsg/VQ+BxC3NXISFgHOvKreAzMk6IkzDmOnvUx4+GDNvYyirKVpuWE0e+YzslHEYh5YMFWRU/of
 VPko/qwRuNhwRePk8ePB2ihzJAXHNfsNZ7hnr5Zzfi58e0DzyJ5NPGXUypJt0FoVziOL058n4tO
 WOd7pSZmRboKF8MQsKjs86toLSYqVHxxr2JiRMnzWdZkJdwYQ175hqT0KqONIY4ZsOmUAxORWjv
 N4qfu+D6FpTO3FJgWSaieAoyVI7GWzfz+qGHNBDP6mdiirdQkbynEc4Y7hI+ymP82XXzBtJ8NI6
 gk5M2Hlhf+UdJpscD9/MhYRVeqazJElXIzOV0vZn2YxUOnz0WBZzAG6T1SA8mZuL3IphmOrekvE
 KioQ9LkUD3zhxrCxH6k5e2rzqd20zHi9xESZSy7wEJBsUCLyxWytYv9Z/dQMzoXyHsxolqLg1Zb
 8RsB+oUehgWnJtXb7gthtqtOHtgqR9PT6Bs+AfrIAPwsgDNB6yZ5fGxLOlmgsCfSuBQ1r3n9qlU
 ZENs2HrJvMZHMlCImIxR1mnB4Yh6/L9R/Xb2AoIjg2ocF5F5TFnkGFeHcABiiEWvhfrgriXW37T
 k9ZdXgNzzKj+xoQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

> I was doing some refactoring, and kept hitting modpost errors and
> warnings. It was getting a bit annoying that a lot of the modpost
> messages have different formats for modules, and different quoting for
> symbols, sections, and namespaces.
> 
> Clean them up a bit.
> 
> BR,
> Jani.
> 
> Jani Nikula (2):
>   modpost: add module as parameter to modpost_log()
>   modpost: use mod_warn() and mod_error(), clean up logging
> 
>  scripts/mod/modpost.c | 112 +++++++++++++++++++++---------------------
>  scripts/mod/modpost.h |   8 +--
>  2 files changed, 60 insertions(+), 60 deletions(-)
> 
> --
> 2.47.3

Thanks for the cleanup!  Looks good to me.

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

