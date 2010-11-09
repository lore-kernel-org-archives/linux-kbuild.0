Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:57238 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753497Ab0KIRDB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 9 Nov 2010 12:03:01 -0500
Date: Tue, 9 Nov 2010 09:01:23 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] serial: 8250: fix uninitialized compiler warning
Message-Id: <20101109090123.6a12f3f2.randy.dunlap@oracle.com>
In-Reply-To: <1289321723.2260.14.camel@cowboy>
References: <1289321723.2260.14.camel@cowboy>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dave@gnu.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-serial@vger.kernel.org

On Tue, 09 Nov 2010 13:55:23 -0300 Davidlohr Bueso wrote:

> From: Davidlohr Bueso <dave@gnu.org>
> 
> This addresses:
> 
>   CC [M]  drivers/serial/8250.o
> drivers/serial/8250.c: In function ‘serial8250_shutdown’:
> drivers/serial/8250.c:1696: warning: ‘i’ may be used uninitialized in this function
> drivers/serial/8250.c:1696: note: ‘i’ was declared here

so in your analysis of this compiler warning, was the warning correct & justified,
or was it false?  I.e., is the init to NULL needed?

If it was false, could we just quieten the warning by using:

	struct irq_info *unitialized_var(i);

plus #include <linux/compiler.h> ?


> Signed-off-by: Davidlohr Bueso <dave@gnu.org>
> ---
>  drivers/serial/8250.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/serial/8250.c b/drivers/serial/8250.c
> index 4d8e14b..f734eee 100644
> --- a/drivers/serial/8250.c
> +++ b/drivers/serial/8250.c
> @@ -1693,7 +1693,7 @@ static int serial_link_irq_chain(struct uart_8250_port *up)
>  
>  static void serial_unlink_irq_chain(struct uart_8250_port *up)
>  {
> -	struct irq_info *i;
> +	struct irq_info *i = NULL;
>  	struct hlist_node *n;
>  	struct hlist_head *h;
>  
> -- 


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
