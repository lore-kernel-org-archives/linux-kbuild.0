Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:54650
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752569Ab0F2Wcl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jun 2010 18:32:41 -0400
Date: Tue, 29 Jun 2010 15:32:54 -0700 (PDT)
Message-Id: <20100629.153254.63029948.davem@davemloft.net>
Subject: Re: [PATCH] net/Makefile: conditionally descend to wireless and
 ieee802154
From: David Miller <davem@davemloft.net>
In-Reply-To: <20100627120025.0232a9d0@absol.kitzblitz>
References: <20100627120025.0232a9d0@absol.kitzblitz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nikai@nikai.net
Cc: netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

From: Nicolas Kaiser <nikai@nikai.net>
Date: Sun, 27 Jun 2010 12:00:25 +0200

> Don't descend to wireless and ieee802154 unless they are actually used.
> 
> Signed-off-by: Nicolas Kaiser <nikai@nikai.net>

Applied.
