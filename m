Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:55631 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757890Ab1EYNy7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 09:54:59 -0400
Date: Wed, 25 May 2011 15:54:58 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 6/6] kbuild: cleanup the rpm buildroot
Message-ID: <20110525135458.GI2276@sepie.suse.cz>
References: <1305653779-3445-1-git-send-email-asharma@fb.com>
 <1305653779-3445-6-git-send-email-asharma@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1305653779-3445-6-git-send-email-asharma@fb.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arun Sharma <asharma@fb.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 17, 2011 at 10:36:19AM -0700, Arun Sharma wrote:
>  echo "%build"
> +echo 'rm -rf $RPM_BUILD_ROOT'

Don't do it, this allows another user to create their or $RPM_BUILD_ROOT
and let you package it.

Michal
