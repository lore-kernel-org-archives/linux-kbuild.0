Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.emlix.com ([46.4.235.150]:43318 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1030379AbeCAN34 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Mar 2018 08:29:56 -0500
In-Reply-To: 
From: Philipp Puschmann <pp@emlix.com>
Subject: Re: [PATCH 0/2] objtool: fix libelf detection in non-standard
 locations
Message-ID: <a8491eba-72b2-7a23-6285-5b40ee0af971@emlix.com>
Date: Thu, 1 Mar 2018 14:29:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-LU
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Robin Jarry <robin.jarry@6wind.com>

Hi,

i also had this libelf problem, didn't see your solution and i solved it via pkg-config
as at least elfutils provide a proper pc-file

https://marc.info/?l=linux-kbuild&m=151990932121433&w=2

Regards,

Philipp Puschmann
