Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:54655
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756552Ab0F2Wcr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jun 2010 18:32:47 -0400
Date: Tue, 29 Jun 2010 15:33:00 -0700 (PDT)
Message-Id: <20100629.153300.209974783.davem@davemloft.net>
Subject: Re: [PATCH] drivers/net/Makefile: conditionally descend to wireless
From: David Miller <davem@davemloft.net>
In-Reply-To: <20100627234452.0f9d19f1@absol.kitzblitz>
References: <20100627234452.0f9d19f1@absol.kitzblitz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nikai@nikai.net
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Nicolas Kaiser <nikai@nikai.net>
Date: Sun, 27 Jun 2010 23:44:52 +0200

> Don't descend to wireless unless it is actually used.
> 
> Signed-off-by: Nicolas Kaiser <nikai@nikai.net>

Applied.
