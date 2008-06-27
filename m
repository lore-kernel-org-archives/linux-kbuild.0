Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:45060 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757454AbYF0NGe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Jun 2008 09:06:34 -0400
Subject: Re: a.out.h userspace headers not present with O=
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20080627130236.GD18644@cs181140183.pp.htv.fi>
References: <20080627130236.GD18644@cs181140183.pp.htv.fi>
Content-Type: text/plain
Date: Fri, 27 Jun 2008 14:06:24 +0100
Message-Id: <1214571984.10393.193.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: sam@ravnborg.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2008-06-27 at 16:02 +0300, Adrian Bunk wrote:
> Commit e53d6a152793a38aa334d6f7a4850642ae45cedc
> (Export <linux/a.out.h> to userspace again.)
> does not work properly when using O= :

Hm, I copied the logic from the existing condition in
include/asm-generic/Kbuild.asm. Does that not work either?

-- 
dwmw2

