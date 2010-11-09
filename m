Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caiajhbdcahe.dreamhost.com ([208.97.132.74]:54661 "EHLO
	homiemail-a5.g.dreamhost.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751841Ab0KIQzg convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Nov 2010 11:55:36 -0500
Subject: [PATCH] serial: 8250: fix uninitialized compiler warning
From: Davidlohr Bueso <dave@gnu.org>
Reply-To: dave@gnu.org
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Nov 2010 13:55:23 -0300
Message-ID: <1289321723.2260.14.camel@cowboy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-serial@vger.kernel.org

From: Davidlohr Bueso <dave@gnu.org>

This addresses:

  CC [M]  drivers/serial/8250.o
drivers/serial/8250.c: In function ‘serial8250_shutdown’:
drivers/serial/8250.c:1696: warning: ‘i’ may be used uninitialized in this function
drivers/serial/8250.c:1696: note: ‘i’ was declared here

Signed-off-by: Davidlohr Bueso <dave@gnu.org>
---
 drivers/serial/8250.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/serial/8250.c b/drivers/serial/8250.c
index 4d8e14b..f734eee 100644
--- a/drivers/serial/8250.c
+++ b/drivers/serial/8250.c
@@ -1693,7 +1693,7 @@ static int serial_link_irq_chain(struct uart_8250_port *up)
 
 static void serial_unlink_irq_chain(struct uart_8250_port *up)
 {
-	struct irq_info *i;
+	struct irq_info *i = NULL;
 	struct hlist_node *n;
 	struct hlist_head *h;
 
-- 
1.7.1



